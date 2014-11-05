# == Schema Information
#
# Table name: subscriptions
#
#  id               :integer          not null, primary key
#  stock_company_id :integer          not null
#  user_id          :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#
# Indexes
#
#  index_subscriptions_on_stock_company_id              (stock_company_id)
#  index_subscriptions_on_stock_company_id_and_user_id  (stock_company_id,user_id) UNIQUE
#  index_subscriptions_on_user_id                       (user_id)
#

class Subscription < ActiveRecord::Base
  belongs_to :stock_company
  belongs_to :user
end
