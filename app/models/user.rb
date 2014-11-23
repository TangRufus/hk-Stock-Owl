# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  role                   :integer          default(0)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0)
#  unlock_token           :string(255)
#  locked_at              :datetime
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  # Keep this order, put new roles at the end
  enum role: [:user, :admin]

  after_initialize :set_default_role, if: :new_record?

  scope :confirmed, -> { where('confirmed_at IS NOT NULL') }

  has_many :subscriptions, as: :subscribed, dependent: :destroy
  has_many :target_companies, through: :subscriptions, source: :subscriptable, source_type: 'StockCompany'
  has_many :target_tags, through: :subscriptions, source: :subscriptable, source_type: 'ExTag'

  def subscribed?(subscriptable)
    target_companies.include?(subscriptable) || target_tags.include?(subscriptable)
  end

  def set_default_role
    self.role ||= :user
  end

  def password_required?
    super if confirmed?
  end

  def password_match?
    errors[:password] << "can't be blank" if password.blank?
    errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    errors[:password_confirmation] << 'does not match password' if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  # Remove after Devise move to Rails 4.2
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later(queue: :devise_mailer)
  end
end
