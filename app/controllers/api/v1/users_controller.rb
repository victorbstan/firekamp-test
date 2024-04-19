# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::V1::ApiController
      before_action :authorized, only: [:auto_login]

      def register
        @user = User.new(user_params)
        if @user.save
          token = encode_token({ user_id: @user.id })
          render json: { user: @user, token: }
        else
          render json: { error: 'Invalid email or password' }
        end
      end

      def login
        @user = User.find_by(email: user_params[:email])
        # if @user&.authenticate(user_params[:password])
        if UserService::UserAuthenticator.call(@user, user_params[:password])
          # add expiration time to token
          @user.touch
          @user.save!
          token = encode_token({ user_id: @user.id })
          render json: { user: @user, token: }
        else
          render json: { error: 'Invalid email or password' }
        end
      end

      def auto_login
        render json: @user
      end

      private

      def user_params
        params.permit(:email, :password)
      end
    end
  end
end
