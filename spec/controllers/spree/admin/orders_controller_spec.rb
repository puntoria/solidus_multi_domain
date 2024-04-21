# frozen_string_literal: true

require "spec_helper"

describe Spree::Admin::OrdersController do
  stub_authorization!

  describe "#index" do
    render_views

    it "renders" do
      get :index
      expect(response).to be_successful
    end

    context "when the user can manage all stores" do
      stub_authorization! do |_user|
        can :manage, Spree::Store
      end

      it "assigns a list of all stores as @stores" do
        get :index
        expect(assigns(:stores)).to eq(Spree::Store.all)
      end
    end

    context "when user cannot manage some stores" do
      stub_authorization! do |_store|
        can :manage, Spree::Store
        cannot :manage, Spree::Store, code: 'inaccessible'
      end

      it "assigns a list of accessible stores as @stores" do
        store = create(:store)
        create(:store, code: 'inaccessible')

        get :index
        expect(assigns(:stores)).to eq [store]
      end
    end
  end

  describe "#edit" do
    render_views

    let(:store) { create(:store) }

    it "renders" do
      get :edit, params: { id: store.to_param }
      expect(response).to be_successful
    end
  end
end
