class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence:true, length: { minimum: 8 }
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :password_confirmation, presence: true
  before_save { self.email = email.downcase }
  validates :email, presence: true,uniqueness: true

  def self.authenticate_with_credentials (email,password)
    email = email.strip
    email=email.downcase
    user = User.find_by_email(email)
    user && user.authenticate(password) 
  end
end
