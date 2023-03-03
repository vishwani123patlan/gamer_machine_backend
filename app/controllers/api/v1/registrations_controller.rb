module Api
  module V1
    class RegistrationsController < Api::V1::ApiController
      # require 'googleauth'
      # require 'google/apis/oauth2_v2'

    	def sign_up
        begin
          @user = User.new(user_params)
          @user.role = 'admin'
        	@user.password_confirmation = @user.password
          if @user.save
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            @redirect_headers = "?token=#{token}&email=#{@user.email}"
            #UserMailer.send_verification_link(@user,  @redirect_headers).deliver_now
          	render json: {success: true, user: @user , token: token, exp_time: time, message: 'User Created Successfully'}
          else
            render json: {success: false, error: @user.errors.full_messages.first}, status: 422
          end
        rescue StandardError => e
          render json: { error: e.message }, status: 422
        end
    	end

      def sign_up_with_google
        id_token = params[:token]
        validator = GoogleIDToken::Validator.new
        begin
          payload = validator.check(id_token, ENV['GOOGLE_CLIENT_ID'])
           # Use the user's Google account information to create a new user account or retrieve an existing user account
          email = payload['email']
          name = payload['name']
          picture = payload['picture']
          @user = User.find_or_create_by(email: email) do |u|
            u.name = name
            u.is_google_account = true
          end
          token = JsonWebToken.encode(user_id: @user.id)
          time = Time.now + 24.hours.to_i
          @redirect_headers = "?token=#{token}&email=#{@user.email}"
          #UserMailer.send_verification_link(@user,  @redirect_headers).deliver_now
          render json: {success: true, data: {user: @user}, token: token, exp_time: time, message: 'User Signin Successfully'}
        rescue StandardError => e
          render json: { error: e.message }, status: 422
        end       
      end

      def verify_email
        begin

        rescue StandardError => e
          render json: {error: e.message}, status: 422
        end
      end

      private
    	def user_params
    		params.require(:registration).permit(:email, :first_name, :last_name, :phone_number, :password, :role, :is_google_account)
    	end
    end
  end
end
