# == Schema Information
#
# Table name: ex_headline_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_ex_headline_categories_on_name  (name) UNIQUE
#

require 'test_helper'

class ExHeadlineCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
