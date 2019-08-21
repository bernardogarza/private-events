class User < ApplicationRecord
    attr_accessor :remember_token
    before_create :remember_me
    
    validates :user_name, :email, presence: true
	before_save :email_down_case
	
	has_many :events, class_name: 'Event', foreign_key: 'creator_id'
	has_many :attended_event, through: :event
    
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
