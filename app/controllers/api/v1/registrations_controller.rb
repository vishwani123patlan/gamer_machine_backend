module Api
  module V1
    class RegistrationsController < Api::V1::ApiController
    	def sign_up
        begin
          @user = User.new(user_params)
        	@user.password_confirmation = @user.password
          if @user.save
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            @redirect_headers = "?token=#{token}&email=#{@user.email}"
            #UserMailer.send_verification_link(@user,  @redirect_headers).deliver_now
          	render json: {success: true, data: {user: @user}, token: token, exp_time: time, message: 'User Created Successfully'}
          else
            render json: {success: false, error: @user.errors}, status: 422
          end
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
    		params.require(:registration).permit(:email, :first_name, :last_name, :phone_number, :password, :role)
    	end
    end
  end
end