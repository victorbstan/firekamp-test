# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::V1::ApiController
      before_action :authorize_request, except: %i[register login]

      def register
        user = User.new(email: user_params[:email], password: user_params[:password])
        if user.save
          token = JsonWebToken.encode(user_id: user.id)
          render json: user, token:, serializer: UserSerializer, status: :created
        else
          render json: { error: user.errors.full_messages }, status: :bad_request
        end
      end

      def login
        user = User.find_by(email: user_params[:email])
        if UserService::UserAuthenticator.call(user, user_params[:password])
          token = JsonWebToken.encode(user_id: user.id)
          render json: user, token:, serializer: UserSerializer, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end

      private

      def user_params
        params.permit(:email, :password, user: {})
      end
    end
  end
end
