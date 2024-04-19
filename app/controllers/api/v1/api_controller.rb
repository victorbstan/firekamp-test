# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::API
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      # rescue_from Exception, with: :internal_server_error

      def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          decoded = JsonWebToken.decode(header)
          @current_user = User.find(decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { error: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { error: e.message }, status: :unauthorized
        end
      end

      def record_not_found
        render json: { error: 'Record not found' }, status: :not_found
      end

      def internal_server_error
        render json: { error: 'Internal server error' }, status: 500
      end
    end
  end
end
