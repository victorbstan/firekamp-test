# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::API
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

      def encode_token(payload)
        payload['exp'] = expiration_time
        JWT.encode(payload, encode_string)
      end

      def auth_header
        # { Authorization 'Bearer <token>' }
        request.headers['Authorization']
      end

      def decoded_token # rubocop:disable Metrics/MethodLength
        return unless auth_header

        token = auth_header.split(' ')[1]

        # header: { 'Authorization': 'Bearer <token>' }
        begin
          JWT.decode(token, encode_string, true, algorithm: 'HS256')
        rescue JWT::ExpiredSignature => e
          # Handle expired token, e.g. logout user or deny access
          logger.debug("JWT EXPIRED #{e}")
          nil
        rescue JWT::DecodeError => e
          # Other errors
          logger.debug("JWT ERROR #{e}")
          nil
        end
      end

      def current_user
        return unless decoded_token

        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
        @user
      end

      def logged_in?
        !!current_user
      end

      def authorized
        return if logged_in?

        render json: { message: 'Please log in' }, status: :unauthorized
      end

      def encode_string
        ENV['API_SECRET_TOKEN']
      end

      def expiration_time
        Time.now.to_i + 10.minutes
      end

      def record_not_found
        render json: { message: 'Record not found' }, status: :not_found
      end
    end
  end
end
