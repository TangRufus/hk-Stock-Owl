class AddReleasedAtToExDocument < ActiveRecord::Migration
  def change
    add_column :ex_documents, :released_at, :datetime
  end
end
