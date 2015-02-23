class User < ActiveRecord::Base

  validate :user_name, presence: true, uniqueness: true

  has_secure_password
end
