class MakeSubscriptionsPolymorphic < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :stock_company_id, :integer, null: false
    remove_column :subscriptions, :user_id, :integer, null: false
    add_reference :subscriptions, :subscriptable, polymorphic: true, index: true, null: false
    add_reference :subscriptions, :subscribed, polymorphic: true, index: true, null: false

    add_index :subscriptions, [:subscriptable_id, :subscriptable_type, :subscribed_id, :subscribed_type], unique: true, name: 'index_unique_subscriptions'
  end
end
