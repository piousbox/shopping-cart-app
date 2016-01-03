require 'spec_helper'

describe Spree::Promotion::Rules::ItemTotal, :type => :model do
  let(:rule) { Spree::Promotion::Rules::ItemTotal.new }
  let(:order) { double(:order) }

  before { rule.preferred_amount = 50 }

  context "preferred operator set to gt" do
    before { rule.preferred_operator = 'gt' }

    it "should be eligible when item total is greater than preferred amount" do
      allow(order).to receive_messages :item_total => 51
      expect(rule).to be_eligible(order)
    end

    context "when item total is equal to preferred amount" do
      before { allow(order).to receive_messages item_total: 50 }
      it "is not eligible" do
        expect(rule).not_to be_eligible(order)
      end
      it "set an error message" do
        rule.eligible?(order)
        expect(rule.eligibility_errors.full_messages.first).
          to eq "This coupon code can't be applied to orders less than or equal to $50.00."
      end
    end

    context "when item total is lower than preferred amount" do
      before { allow(order).to receive_messages item_total: 49 }
      it "is not eligible" do
        expect(rule).not_to be_eligible(order)
      end
      it "set an error message" do
        rule.eligible?(order)
        expect(rule.eligibility_errors.full_messages.first).
          to eq "This coupon code can't be applied to orders less than or equal to $50.00."
      end
    end
  end

  context "preferred operator set to gte" do
    before { rule.preferred_operator = 'gte' }

    it "should be eligible when item total is greater than preferred amount" do
      allow(order).to receive_messages :item_total => 51
      expect(rule).to be_eligible(order)
    end

    it "should be eligible when item total is equal to preferred amount" do
      allow(order).to receive_messages :item_total => 50
      expect(rule).to be_eligible(order)
    end

    context "when item total is lower than preferred amount" do
      before { allow(order).to receive_messages item_total: 49 }
      it "is not eligible" do
        expect(rule).not_to be_eligible(order)
      end
      it "set an error message" do
        rule.eligible?(order)
        expect(rule.eligibility_errors.full_messages.first).
          to eq "This coupon code can't be applied to orders less than $50.00."
      end
    end
  end
end
