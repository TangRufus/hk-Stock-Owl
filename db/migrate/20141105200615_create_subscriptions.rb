class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :subscriptable,  polymorphic: true, index: true, null: false
      t.references :subscribed,     polymorphic: true, index: true, null: false

      t.timestamps
    end
    add_index :subscriptions, [:subscriptable_id, :subscriptable_type, :subscribed_id, :subscribed_type], unique: true, name: 'index_unique_subscriptions'
  end
end
