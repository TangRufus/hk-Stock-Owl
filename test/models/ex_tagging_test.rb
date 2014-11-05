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

require 'test_helper'

class ExTaggingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
