class User < ApplicationRecord
     has_secure_password
     has_many :jobs
     has_many :categories, :through => :jobs
     validates :email,:password,:name, :presence => true
     validates :email, uniqueness: true
    

    def self.find_or_create_by_omniauth(auth_hash)
        self.find_or_create_by(:email => auth_hash["info"]["email"]) do |user|
        #self.where(:email => auth_hash(["info"]["email"])).find_or_create_by do |user|
        user.password =SecureRandom.hex
      end
   end
end
