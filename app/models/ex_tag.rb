# == Schema Information
#
# Table name: ex_tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_ex_tags_on_name  (name) UNIQUE
#

class ExTag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  auto_strip_attributes :name, squish: true

  has_many :ex_taggings, dependent: :destroy
  has_many :ex_documents, through: :ex_taggings

  has_many :subscriptions, as: :subscriptable, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :subscribed, source_type: "User"

  def self.provision_from_hkexnews(names_string)
    names_string = names_string.gsub(/\n/, '').gsub(/\r/, '').squeeze(' ').strip.gsub(' - [', '|||').gsub(' / ', '|||').gsub('...More', '').gsub(']', '')

    names_array = names_string.split('|||').uniq
    names_array.collect { |name| ExTag.find_or_create_by(name: name.strip) }
  end
end
