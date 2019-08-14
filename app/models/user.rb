class User < ApplicationRecord
    validates :user_name, :email, presence: true
    before_save :email_down_case
    

    private
        def email_down_case
            email.downcase!
        end
end
