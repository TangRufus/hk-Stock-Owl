class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :stock_company, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
    
    add_index :subscriptions, [:stock_company_id, :user_id], unique: true
  end
end
