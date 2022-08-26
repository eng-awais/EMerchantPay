# frozen_string_literal: true

module Api
  module V1
    class BaseController < ActionController::API

      attr_reader :current_user

      before_action :authenticate_request!

      protected

      def authenticate_request!
        unless user_id_in_token?
          render json: { errors: ['Not Authenticated'] }, status: :unauthorized
          return
        end
        @current_user = User.find(auth_token[:user_id])
      rescue JWT::VerificationError, JWT::DecodeError
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      end

      private

      def http_token
        @http_token ||= (request.headers['Authorization'].split.last if request.headers['Authorization'].present?)
      end

      def auth_token
        @auth_token ||= JsonWebToken.decode(http_token)
      end

      def user_id_in_token?
        http_token && auth_token && auth_token[:user_id]
      end
    end
  end
end
