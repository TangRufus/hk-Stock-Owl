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

end
