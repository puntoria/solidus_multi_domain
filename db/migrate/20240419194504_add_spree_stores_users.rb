class AddSpreeStoresUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :spree_stores_users do |t|
      t.references :store, null: false, index: true, foreign_key: true
      t.references :user, null: false, index: true, foreign_key: { to_table: :spree_users }
      t.timestamps
    end
  end
end
