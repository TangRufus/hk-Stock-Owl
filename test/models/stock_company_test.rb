# == Schema Information
#
# Table name: stock_companies
#
#  id         :integer          not null, primary key
#  name       :text             default(""), not null
#  code       :integer          not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_stock_companies_on_code  (code) UNIQUE
#

require 'test_helper'

class StockCompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
