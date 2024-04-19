# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable

  def authenticate(password)
    # using devise method
    valid_password? password
  end

  def to_s
    email
  end
end
