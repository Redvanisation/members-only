class User < ApplicationRecord
    before_create :remember
    validates :username, presence: true, length: { maximum: 20}
    validates :email, presence: true, uniqueness: true
    
    has_secure_password


def remember 
   token = SecureRandom.urlsafe_base64.to_s
   Digest::SHA1.hexdigest(token)
   
end 

end
