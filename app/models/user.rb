class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar

  validates_presence_of :email
  validates_uniqueness_of :email, :phone_number
  validates :email, format: { with:  }

  before_create :set_active_true

  private

  def set_active_true
    self.active = true
  end
end
