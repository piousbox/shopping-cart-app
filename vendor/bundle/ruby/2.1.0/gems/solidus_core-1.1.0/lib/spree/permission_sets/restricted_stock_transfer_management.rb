module Spree
  module PermissionSets
    # This is a permission set that offers an alternative to {StockManagement}.
    #
    # Instead of allowing management access for all stock transfers and items, only allow
    # the management of stock transfers for locations the user is associated with.
    #
    # Users can be associated with stock locations via the admin user interface.
    #
    # The logic here is unfortunately rather complex and boils down to:
    # - A user has read only access to all stock locations (including inactive ones)
    # - A user can see all stock transfers for their associated stock locations regardless of the
    #   fact that they may not be associated with both the destination and the source, as long as
    #   they are associated with at least one of the two.
    # - A user can manage stock transfers only if they are associated with both the destination and the source,
    #   or if the user is associated with the source, and the transfer has not yet been assigned a destination.
    #
    # @see Spree::PermissionSets::Base
    class RestrictedStockTransferManagement < PermissionSets::Base
      def activate!
        if user.stock_locations.any?
          can :display, Spree::StockLocation, id: user_location_ids
          can [:admin, :create], Spree::StockTransfer
          can :display, Spree::StockTransfer, source_location_id: source_location_ids
          can :display, Spree::StockTransfer, destination_location_id: destination_location_ids
          can :manage, Spree::StockTransfer,
            source_location_id: source_location_ids,
            destination_location_id: destination_location_ids_with_undefined_destination

          can :transfer_from, Spree::StockLocation, id: source_location_ids
          can :transfer_to, Spree::StockLocation, id: destination_location_ids

          can :manage, Spree::TransferItem, stock_transfer: {
            source_location_id: source_location_ids,
            destination_location_id: destination_location_ids_with_undefined_destination
          }
        end
      end

      private

      def user_location_ids
        @user_location_ids ||= user.stock_locations.pluck(:id)
      end

      # @note Meant to facilitate extension - override to define custom ids
      def source_location_ids
        user_location_ids
      end

      # @note Meant to facilitate extension - override to define custom ids
      def destination_location_ids
        user_location_ids
      end

      def destination_location_ids_with_undefined_destination
        destination_location_ids + [nil]
      end
    end
  end
end
