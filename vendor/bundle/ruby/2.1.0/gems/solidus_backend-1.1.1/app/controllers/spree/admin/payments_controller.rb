module Spree
  module Admin
    class PaymentsController < Spree::Admin::BaseController
      before_filter :load_order, :only => [:create, :new, :index, :fire]
      before_filter :load_payment, :except => [:create, :new, :index, :fire]
      before_filter :load_payment_for_fire, :only => :fire
      before_filter :load_data
      before_filter :require_bill_address, only: [:index]

      respond_to :html

      def index
        @payments = @order.payments.includes(:refunds => :reason)
        @refunds = @payments.flat_map(&:refunds)
        redirect_to new_admin_order_payment_url(@order) if @payments.empty?
      end

      def new
        @payment = @order.payments.build
      end

      def create
        @payment ||= @order.payments.build(object_params)
        if @payment.payment_method.source_required? && params[:card].present? and params[:card] != 'new'
          @payment.source = @payment.payment_method.payment_source_class.find_by_id(params[:card])
        end

        begin
          if @payment.save
            if @order.completed?
              # If the order was already complete then go ahead and process the payment
              # (auth and/or capture depending on payment method configuration)
              @payment.process! if @payment.checkout?
            else
              # Transition order as far as it will go.
              while @order.next; end
            end

            flash[:success] = flash_message_for(@payment, :successfully_created)
            redirect_to admin_order_payments_path(@order)
          else
            flash[:error] = Spree.t(:payment_could_not_be_created)
            render :new
          end
        rescue Spree::Core::GatewayError => e
          flash[:error] = "#{e.message}"
          redirect_to new_admin_order_payment_path(@order)
        end
      end

      def fire
        return unless event = params[:e] and @payment.payment_source

        # Because we have a transition method also called void, we do this to avoid conflicts.
        event = "void_transaction" if event == "void"
        if @payment.send("#{event}!")
          flash[:success] = Spree.t(:payment_updated)
        else
          flash[:error] = Spree.t(:cannot_perform_operation)
        end
      rescue Spree::Core::GatewayError => ge
        flash[:error] = "#{ge.message}"
      ensure
        redirect_to admin_order_payments_path(@order)
      end

      private

      def object_params
        if params[:payment] and params[:payment_source] and source_params = params.delete(:payment_source)[params[:payment][:payment_method_id]]
          params[:payment][:source_attributes] = source_params
        end
        
        params.require(:payment).permit(permitted_payment_attributes)
      end

      def load_data
        @amount = params[:amount] || load_order.total
        @payment_methods = PaymentMethod.available(:back_end)
        if @payment and @payment.payment_method
          @payment_method = @payment.payment_method
        else
          @payment_method = @payment_methods.first
        end
      end

      def load_order
        @order = Order.find_by_number!(params[:order_id])
        authorize! action, @order
        @order
      end

      def load_payment
        @payment = Payment.find(params[:id])
      end

      def load_payment_for_fire
        load_payment
        authorize! params[:e].to_sym, @payment
      end

      def model_class
        Spree::Payment
      end

      def require_bill_address
        if Spree::Config[:order_bill_address_used] && @order.bill_address.nil?
          flash[:notice] = Spree.t(:fill_in_customer_info)
          redirect_to edit_admin_order_customer_url(@order)
        end
      end
    end
  end
end
