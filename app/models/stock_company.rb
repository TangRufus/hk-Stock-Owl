# == Schema Information
#
# Table name: stock_companies
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  code       :integer          not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_stock_companies_on_code  (code) UNIQUE
#

class StockCompany < ActiveRecord::Base
  validates :name, :code, presence: true
  validates :code, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 99999 }

end
