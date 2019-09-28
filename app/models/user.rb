# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :token
  before_create :remember
  before_save { self.email = email.downcase }
  has_many :posts

  validates :username, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_secure_password

  def self.new_token
    token = SecureRandom.urlsafe_base64
    Digest::SHA1.hexdigest(token.to_s)
  end

  def change_token
    self.token = User.new_token
    update_attribute(:remember_token, token)
  end

  private

  def remember
    self.remember_token = User.new_token
  end
end
