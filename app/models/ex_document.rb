# == Schema Information
#
# Table name: ex_documents
#
#  id               :integer          not null, primary key
#  title            :text             default(""), not null
#  link             :text             default("http://www.hkexnews.hk/"), not null
#  short_link       :text             default("")
#  stock_company_id :integer
#  released_at      :datetime         not null
#  created_at       :datetime
#  updated_at       :datetime
#
# Indexes
#
#  index_ex_documents_on_stock_company_id  (stock_company_id)
#

class ExDocument < ActiveRecord::Base
  include HasShortLink

  validates :title, :link, :stock_company_id, :released_at, presence: true

  auto_strip_attributes :title, squish: true

  belongs_to :stock_company

  has_many :ex_taggings, dependent: :destroy
  has_many :ex_tags, through: :ex_taggings

  after_commit :send_new_ex_document_notification, on: :create, :if => :released_within_1_hour?

  def self.provision_from_hkexnews(hkt_released_at, stock_code, stock_name, tags, title, link)
    sc = StockCompany.provision_from_hkexnews(stock_code, stock_name)
    return nil if sc.nil?

    datetime_format = '%d/%m/%Y%H:%M %z'
    hkt_released_at += ' +0800'
    released_at = DateTime.strptime(hkt_released_at, datetime_format)

    title = title.gsub(/\n/, ' ').gsub(/\r/, ' ').titleize.squeeze(" ").strip
    link = link.gsub(/\n/, '').gsub(/\r/, '').gsub(' ', '')

    doc = ExDocument.where(released_at: released_at, stock_company_id: sc.id, link: link).first

    if doc.nil?
      doc = sc.ex_documents.create(released_at: released_at, title: title, link: link)
      tags = ExTag.provision_from_hkexnews(tags)
      doc.ex_tags = tags
    end

    doc
  end

  def send_new_ex_document_notification
    subscriber_list.each do |subscriber|
      HkExNewsMailer.new_ex_document_notification(self, subscriber, stock_company).deliver_later
    end
  end

  def subscriber_list
    list = stock_company.subscribers

    list += ex_tags.map do |tag|
      tag.subscribers
    end

    list.flatten.uniq
  end

  def released_within_1_hour?
    released_at > 1.hour.ago
  end
end
