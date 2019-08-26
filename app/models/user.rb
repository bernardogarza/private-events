# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :remember_me

  validates :user_name, presence: true, uniqueness: true
  before_save :email_down_case

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_many :events, class_name: 'Event', foreign_key: 'creator_id'

  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  private

  def email_down_case
    email.downcase!
  end

  def remember_me
    self.remember_token = User.new_token
    self.remember_digest = User.digest(remember_token)
  end
end
