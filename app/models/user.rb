class User < ApplicationRecord
    attr_accessor :token
    before_create :remember
    has_many :posts

    validates :username, presence: true, length: { maximum: 20}
    validates :email, presence: true, uniqueness: true
    
    has_secure_password


    def User.new_token
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
