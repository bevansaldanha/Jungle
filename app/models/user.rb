class User < ApplicationRecord
  has_secure_password
  validates :password, length: { minimum: 5 }
  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    p user  
    if user.authenticate(password)
      user
    else
      nil
    end
  end
end
