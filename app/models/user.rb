class User < ApplicationRecord
    before_create :remember


    validates :username, presence: true, length: { maximum: 20}
    validates :email, presence: true, uniqueness: true
    
    has_secure_password


    def User.new_token
        token = SecureRandom.urlsafe_base64
        Digest::SHA1.hexdigest(token.to_s)
    end

    private

        def remember
            self.remember_token = User.new_token
        end

end
