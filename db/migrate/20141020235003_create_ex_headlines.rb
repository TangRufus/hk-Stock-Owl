class CreateExHeadlines < ActiveRecord::Migration
  def change
    create_table :ex_headlines do |t|
      t.references :ex_document, index: true
      t.references :ex_headline_category, index: true

      t.timestamps
    end
  end
end
