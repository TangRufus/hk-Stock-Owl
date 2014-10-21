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

class ExHeadlineCategory < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  auto_strip_attributes :name, :squish => true

  has_many :ex_headlines
  has_many :ex_documents, through: :ex_headlines

  def self.find_or_create_from_hkexnews(names_string)
    # gsub! returns nil if pattern does not exisit
    names_string = names_string.gsub(' - [', '|||')
    names_string = names_string.gsub(' / ', '|||')
    names_string = names_string.gsub(']', '')

    names_array = names_string.split("|||").uniq
    names_array.collect { |name| ExHeadlineCategory.where( :name => name.strip ).first_or_create! }
  end

end
