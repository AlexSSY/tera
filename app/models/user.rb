class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar

  validates_presence_of :email
  validates_uniqueness_of :email, :phone_number
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates_length_of :password, within: 6..20,
    too_short: "must be at least 6 characters", too_long: "must be no more than 20 characters", if: :password_required?

  before_create :set_active_true

  private

  def set_active_true
    self.active = true
  end

  def password_required?
    password.present?
  end
end
