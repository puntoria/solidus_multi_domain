# frozen_string_literal: true

require "spec_helper"

describe Spree::Admin::StoresController do
  stub_authorization!

  describe "#create" do
    let(:user) { create(:user) }
    let(:current_api_user) { user }

    let(:store_params) do
      {
        name: "New Store",
        url: "http://new-store.example.com",
        mail_from_address: "hello@new-store.example.com",
        code: "new_store",
        default_currency: "EUR"
      }
    end

    before do
      allow(controller).to receive_messages spree_current_user: user
    end

    it "creates a new store" do
      expect {
        post :create, params: { store: store_params }
      }.to change(Spree::Store, :count).by(1)
    end

    it "redirects to the stores index" do
      post :create, params: { store: store_params }
      expect(response).to redirect_to(admin_stores_path)
    end

    it "associates the current user with the store" do
      post :create, params: { store: store_params }
      expect(Spree::Store.last.users.first).to eq(user)
    end
  end
end
