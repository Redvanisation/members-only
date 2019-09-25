class User < ApplicationRecord
    
    validates :username, presence: true, length: { maximum: 20}
    validates :email, presence: true, uniqueness: true
    
    has_secure_password
end
