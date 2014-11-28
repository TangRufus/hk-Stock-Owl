# == Schema Information
#
# Table name: subscriptions
#
#  id                 :integer          not null, primary key
#  subscriptable_id   :integer          not null
#  subscriptable_type :string           not null
#  subscribed_id      :integer          not null
#  subscribed_type    :string           not null
#  created_at         :datetime
#  updated_at         :datetime
#
# Indexes
#
#  index_subscriptions_on_subscribed_type_and_subscribed_id        (subscribed_type,subscribed_id)
#  index_subscriptions_on_subscriptable_type_and_subscriptable_id  (subscriptable_type,subscriptable_id)
#  index_unique_subscriptions                                      (subscriptable_id,subscriptable_type,subscribed_id,subscribed_type) UNIQUE
#

require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
