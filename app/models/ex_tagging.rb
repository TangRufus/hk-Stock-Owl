# == Schema Information
#
# Table name: ex_taggings
#
#  id             :integer          not null, primary key
#  ex_document_id :integer
#  ex_tag_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_ex_taggings_on_ex_document_id  (ex_document_id)
#  index_ex_taggings_on_ex_tag_id       (ex_tag_id)
#

class ExTagging < ActiveRecord::Base
  belongs_to :ex_document
  belongs_to :ex_tag
end
