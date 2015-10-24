require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :answers
  has_many :comments

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..250 }

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
