module Subscriptable
  extend ActiveSupport::Concern

  included do
    has_many :subscriptions, as: :subscriptable, dependent: :destroy
    has_many :subscribers, through: :subscriptions, source: :subscribed, source_type: "User"
  end
end
