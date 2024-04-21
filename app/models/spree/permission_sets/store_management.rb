# frozen_string_literal: true

module Spree
  module PermissionSets
    class StoreManagement < PermissionSets::Base
      def activate!
        can :manage, Spree::Store, id: store_ids
      end

      def store_ids
        @ids ||= user.stores.pluck(:id)
      end
    end
  end
end
