# frozen_string_literal: true

require 'spec_helper'

describe Spree::Order do
  context "validations" do
    it "validates presence of store_id" do
      order = Spree::Order.new
      order.valid?
      expect(order.errors[:store_id]).to include("can't be blank")
    end
  end
end
