# frozen_string_literal: true

module UserService
  class UserAuthenticator < ApplicationService
    attr_reader :user, :password

    def initialize(user, password)
      @user = user
      @password = password
    end

    def call
      @user&.authenticate(@password)
    end
  end
end
