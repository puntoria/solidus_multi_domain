# frozen_string_literal: true

class Spree::Admin::StoresController < Spree::Admin::ResourceController
  before_action :load_payment_methods
  before_action :load_shipping_methods

  def create
    @store = Spree::Store.new(store_params)
    authorize! :manage, @store

    if @store.save
      @store.users << spree_current_user
      flash[:success] = flash_message_for(@store, :successfully_created)
      redirect_to admin_stores_path
    else
      flash.now[:error] = @store.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def load_payment_methods
    @payment_methods = Spree::PaymentMethod.all
  end

  def load_shipping_methods
    @shipping_methods = Spree::ShippingMethod.all
  end

  def store_params
    params.require(:store).permit(permitted_params)
  end

  def permitted_params
    Spree::PermittedAttributes.store_attributes + %i[store_id code]
  end
end
