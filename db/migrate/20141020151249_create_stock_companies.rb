class CreateStockCompanies < ActiveRecord::Migration
  def change
    create_table :stock_companies do |t|
      t.string :name,   default: "",    null: false
      t.integer :code,                  null: false

      t.timestamps
    end
    add_index :stock_companies, :code, unique: true
  end
end
