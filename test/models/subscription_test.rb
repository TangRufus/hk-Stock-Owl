# == Schema Information
#
# Table name: subscriptions
#
#  id                 :integer          not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  subscriptable_id   :integer          not null
#  subscriptable_type :string(255)      not null
#  subscribed_id      :integer          not null
#  subscribed_type    :string(255)      not null
#
# Indexes
#
#  index_subscriptions_on_subscribed_id_and_subscribed_type        (subscribed_id,subscribed_type)
#  index_subscriptions_on_subscriptable_id_and_subscriptable_type  (subscriptable_id,subscriptable_type)
#  index_unique_subscriptions                                      (subscriptable_id,subscriptable_type,subscribed_id,subscribed_type) UNIQUE
#

require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
