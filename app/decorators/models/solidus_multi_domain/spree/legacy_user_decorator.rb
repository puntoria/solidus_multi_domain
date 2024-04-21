module SolidusMultiDomain
  module Spree
    module LegacyUserDecorator
      def self.prepended(base)
        base.class_eval do
          has_and_belongs_to_many :stores, join_table: "spree_stores_users", class_name: ::Spree::Store.to_s
        end
      end

      ::Spree.user_class.prepend self
    end
  end
end
