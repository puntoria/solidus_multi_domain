# frozen_string_literal: true

class Spree::Admin::StoresController < Spree::Admin::ResourceController
  before_action :load_payment_methods, only: [:index]
  before_action :load_shipping_methods, only: [:index]

  def index
    authorize! :manage, Spree::Store

    respond_with(@stores) do |format|
      format.html
      format.json
    end
  end

  private

  def load_payment_methods
    @payment_methods = Spree::PaymentMethod.all
  end

  def load_shipping_methods
    @shipping_methods = Spree::ShippingMethod.all
  end
end
