# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable

  validates :email, presence: true, length: { maximum: 500 }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { in: 6..20 }

  def authenticate(password)
    # using devise method
    valid_password? password
  end

  def to_s
    email
  end
end
