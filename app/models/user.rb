class User < ApplicationRecord
    validate :user_name, :email, presence: true
end
