class User < ApplicationRecord
    has_secure_password
    validates :email, presence:true 
    validates :email, uniqueness:true
    validates :name, presence:true 
    validates :name, uniqueness:true
    validates :company,presence:true
    validates :company,uniqueness:true
    validates :url,  presence:true

    def self.find_or_create_by_omniauth(auth_hash)
        self.find_or_create_by(:email => auth_hash["info"]["email"]) do |user|
        #self.where(:email => auth_hash(["info"]["email"])).find_or_create_by do |user|
        user.password =SecureRandom.hex
      end
   end
end
