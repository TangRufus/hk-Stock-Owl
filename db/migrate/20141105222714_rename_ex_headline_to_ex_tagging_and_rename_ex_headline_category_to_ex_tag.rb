class RenameExHeadlineToExTaggingAndRenameExHeadlineCategoryToExTag < ActiveRecord::Migration
  def change
    rename_table :ex_headlines, :ex_taggings
    rename_table :ex_headline_categories, :ex_tags

    rename_column :ex_taggings, :ex_headline_category_id, :ex_tag_id
  end
end
