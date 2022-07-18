class Api::V1::TeamsController < Api::V1::ApiController
	before_action :authorize_request

	def create
		begin
			@team = Team.new(team_params.except(:players))
			@team.user_id = @current_user.id
			team = @team.save(team_params)
			if team.present?
				render json: {success: true, team: team}
			else
				render json: {error: true, errors: team.errors.full_messages}, status: :unprocessable_entity
			end
		rescue Exception => e
			render json: { error: e.message }, status: :unprocessable_entity
		end
	end

	private
	def team_params
		params.require(:team).permit!
	end
end