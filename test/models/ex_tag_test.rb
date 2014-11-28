# == Schema Information
#
# Table name: ex_tags
#
#  id         :integer          not null, primary key
#  name       :text             default(""), not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_ex_tags_on_name  (name) UNIQUE
#

require 'test_helper'

class ExTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
