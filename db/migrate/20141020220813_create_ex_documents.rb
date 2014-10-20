class CreateExDocuments < ActiveRecord::Migration
  def change
    create_table :ex_documents do |t|
      t.text :title, default: "", null: false
      t.text :link, default: "http://www.hkexnews.hk/", null: false
      t.references :stock_company, index: true

      t.timestamps
    end
  end
end
