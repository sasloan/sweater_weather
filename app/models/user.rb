class User < ApplicationRecord
  validates_presence_of :email, :password_digest
  validates_uniqueness_of :email
  
  has_secure_password

  before_create do |user|
    user.api_key = user.generate_api_key
  end
  
  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_key: token)
    end
  end
end
