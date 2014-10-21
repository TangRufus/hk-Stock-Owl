# == Schema Information
#
# Table name: ex_documents
#
#  id               :integer          not null, primary key
#  title            :text             default(""), not null
#  link             :text             default("http://www.hkexnews.hk/"), not null
#  stock_company_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#  released_at      :datetime
#
# Indexes
#
#  index_ex_documents_on_stock_company_id  (stock_company_id)
#

class ExDocument < ActiveRecord::Base
  validates :title, :link, :stock_company_id, presence: true

  auto_strip_attributes :title, :squish => true
  auto_strip_attributes :link, :delete_whitespaces => true   
  
  belongs_to :stock_company

  has_many :ex_headlines
  has_many :ex_headline_categories, through: :ex_headlines

end