# == Schema Information
#
# Table name: ex_headlines
#
#  id                      :integer          not null, primary key
#  ex_document_id          :integer
#  ex_headline_category_id :integer
#  created_at              :datetime
#  updated_at              :datetime
#
# Indexes
#
#  index_ex_headlines_on_ex_document_id           (ex_document_id)
#  index_ex_headlines_on_ex_headline_category_id  (ex_headline_category_id)
#

require 'test_helper'

class ExHeadlineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
