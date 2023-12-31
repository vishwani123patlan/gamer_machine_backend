module Api
  module V1
    class ApiController < ActionController::API
    	def not_found
        render json: { error: 'not_found' }
      end

      def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          @decoded = JsonWebToken.decode(header)
          @current_user_id = @decoded[:user_id]
          @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { errors: e.message }, status: :unauthorized
        end
      end

      def is_admin
      	render json: {error: true, errors: "Not Authorize"}, status: :unauthorized if (@current_user.role !="admin")
      end
    end
  end
end