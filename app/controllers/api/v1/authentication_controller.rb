module Api
  module V1
    class AuthenticationController < Api::V1::ApiController
    	before_action :authorize_request, except: :sign_in
      #skip_before_action :verify_authenticity_token, only: [:sign_in]
      # POST /auth/login
      def sign_in
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
          token = JsonWebToken.encode(user_id: @user.id)
          time = Time.now + 24.hours.to_i
          user_serializer = UserSerializer.new(@user).serializable_hash
          render json: {success: true, token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                         user: user_serializer, message: "Log in successfully!" }
        else
          render json: {success: false, error: 'unauthorized' }, status: :unauthorized
        end
      end

      private

      def login_params
        params.permit(:email, :password)
      end
    end
  end
end