class UserMailer < ApplicationMailer
	def send_verification_link(user, request_headers)
		@user = user
		@redirect_headers = request_headers
		@application_url = "http://localhost:3000/"
		@redirect_url  = @application_url + '/api/v1/verify_email'+@redirect_headers
		mail(to: @user.email, subject: 'Verify Email For Gamers Machine')
	end
end