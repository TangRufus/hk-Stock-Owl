class CreateExTaggings < ActiveRecord::Migration
  def change
    create_table :ex_taggings do |t|
      t.references :ex_document,  index: true
      t.references :ex_tag,       index: true

      t.timestamps
    end
  end
end
