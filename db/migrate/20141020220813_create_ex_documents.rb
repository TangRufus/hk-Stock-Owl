class CreateExDocuments < ActiveRecord::Migration
  def change
    create_table :ex_documents do |t|
      t.text        :title,           default: "",                        null: false
      t.text        :link,            default: "http://www.hkexnews.hk/", null: false
      t.text        :short_link,      default: ""
      t.references  :stock_company,   index: true
      t.datetime    :released_at,                                         null: false

      t.timestamps
    end
  end
end
