# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable

  validates :email, presence: true, length: { maximum: 500 }, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 },
                       if: -> { new_record? || !password.nil? }

  def authenticate(password)
    # using devise method
    valid_password? password
  end

  def to_s
    email
  end
end
