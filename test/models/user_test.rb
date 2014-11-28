# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :text             default(""), not null
#  encrypted_password     :text             default(""), not null
#  reset_password_token   :text
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :text
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :text
#  failed_attempts        :integer          default("0"), not null
#  unlock_token           :text
#  locked_at              :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  role                   :integer          default("0")
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
