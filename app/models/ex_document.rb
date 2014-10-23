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
#  short_link       :text
#
# Indexes
#
#  index_ex_documents_on_stock_company_id  (stock_company_id)
#

class ExDocument < ActiveRecord::Base
  validates :title, :link, :stock_company_id, :released_at, presence: true

  auto_strip_attributes :title, :squish => true
  auto_strip_attributes :link, :short_link, :delete_whitespaces => true

  belongs_to :stock_company

  has_many :ex_headlines
  has_many :ex_headline_categories, through: :ex_headlines

  after_create :shorten_link

  def self.find_or_create_from_hkexnews(hkt_released_at, stock_code, stock_name, headline_categories, title, link)
    datetime_format = "%d/%m/%Y%H:%M %z"
    hkt_released_at += " +0800"
    released_at = DateTime.strptime(hkt_released_at, datetime_format)

    sc = StockCompany.find_or_create_from_hkexnews stock_code, stock_name

    title = title.gsub(/\n/, ' ').gsub(/\r/, ' ').titleize.squeeze(" ").strip
    link = link.gsub(/\n/, '').gsub(/\r/, '').gsub(' ', '')

    doc = ExDocument.where(:released_at => released_at, :stock_company_id => sc.id, :title => title, :link => link).first

    if doc.nil?
      doc = sc.ex_documents.create(:released_at => released_at, :title => title, :link => link)
      cats = ExHeadlineCategory.find_or_create_from_hkexnews headline_categories
      doc.ex_headline_categories = cats
    end

    doc
  end

  def shorten_link
    update_attribute(:short_link, Bitly.client.shorten(link).short_url) if short_link.nil?
  end

  def very_short_link
    shorten_link if short_link.nil?
    short_link.sub!(/^http:\/\//,'')
  end

end
