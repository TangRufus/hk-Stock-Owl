class CreateExHeadlineCategories < ActiveRecord::Migration
  def change
    create_table :ex_headline_categories do |t|
      t.string :name, default: "", null: false

      t.timestamps
    end
    add_index :ex_headline_categories, :name, unique: true
  end
end
