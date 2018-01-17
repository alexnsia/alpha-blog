class User < ApplicationRecord
  has_many :articles
  before_save { self.email = email.downcase }
  befor_create { generate_token(:auth_token) }
  validates :username, presence: true,
            uniqueness: { case_sensitive: false},
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end



end
