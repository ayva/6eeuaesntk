class User < ActiveRecord::Base

  has_many :shoes

  validates :username, length: { in: 6..20 }

  has_secure_password

  validates :password, 
            :length => { :in => 8..24 }, 
            :allow_nil => true
end
