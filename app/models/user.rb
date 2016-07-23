class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy #all articles are destroyed when user is destroyed
  before_save { self.email = email.downcase } #before user hits db, itll take email value and convert it to lowercase#
  validates :username, presence: true,
             uniqueness: { case_sensitive: false },
             length: {minimum: 3, maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105},
            uniqueness: {case_sensitive: false},
            format: { with: VALID_EMAIL_REGEX }

    has_secure_password

end