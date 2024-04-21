# frozen_string_literal: true

require "spec_helper"

describe Spree::Product do
  describe ".by_store" do
    it "returns products by store" do
      store = FactoryBot.create(:store)
      product = FactoryBot.create(:product, stores: [store])
      product2 = FactoryBot.create(:product, slug: 'something else')

      expect(Spree::Product.by_store(store)).to eq([product])
    end
  end
end
