class User < ApplicationRecord
  has_many :feeds, dependent: :destroy

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true,
                    length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  
  has_secure_password

  validates :password, presence: true, confirmation: true, length: {minimum: 6}, on: :create
  validates :password, presence: true, confirmation: true, length: {minimum: 6}, on: :update, if: :password_digest_changed?
  validates :password_confirmation, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :update, if: :password_digest_changed?
  
  mount_uploader :avatar, ImageUploader
end
