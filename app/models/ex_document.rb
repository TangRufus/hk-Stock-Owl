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
  validates :title, :link, :stock_company_id, :released_at, presence: true

  auto_strip_attributes :title, :squish => true
  auto_strip_attributes :link, :delete_whitespaces => true   
  
  belongs_to :stock_company

  has_many :ex_headlines
  has_many :ex_headline_categories, through: :ex_headlines

  def self.find_or_create_from_hkexnews(released_at, stock_code, stock_name, headline_categories, title, link)
      sc = StockCompany.find_or_create_from_hkexnews stock_code, stock_name
      cats = ExHeadlineCategory.find_or_create_from_hkexnews headline_categories

      datetime_format = "%d/%m/%Y%H:%M %z"
      released_at += " +0800"
      released_at = DateTime.strptime(released_at, datetime_format)

      doc = ExDocument.where(:released_at => released_at, :stock_company_id => sc.id,:title => title, :link => link).first_or_initialize
      
      doc.ex_headline_categories = cats
      sc.ex_documents << doc

      doc
  end

end
