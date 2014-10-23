class AddShortLinkToExDocument < ActiveRecord::Migration
  def change
    add_column :ex_documents, :short_link, :text
  end
end
