class User < ApplicationRecord
  has_many :articles
  before_save{ self.email=email.downcase}
  validates :username,presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 3,maximum: 25}
  Valid_email_checker=/\A(\S+)@(.+)\.(\S+)\z/i
  validates :email,presence: true,
            uniqueness: {case_sensitive: false},
            format: {with: Valid_email_checker}
end