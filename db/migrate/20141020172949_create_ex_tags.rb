class CreateExTags < ActiveRecord::Migration
  def change
    create_table :ex_tags do |t|
      t.text :name, default: "", null: false

      t.timestamps
    end

    add_index :ex_tags, :name, unique: true
  end
end
