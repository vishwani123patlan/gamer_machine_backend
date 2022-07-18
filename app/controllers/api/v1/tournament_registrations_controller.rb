class Api::V1::TournamentRegistrationsController < Api::V1::ApiController
	before_action :authorize_request

	def create
		begin
			@tournament = Tournament.find(params[:tournament_id])
			unless params[:team_id].present?
				@team = Team.new(team_params.except(:players))
				@team.user_id = @current_user.id
				team = @team.save(team_params)
				if team.present?
					@tournament.participant_teams.create!(user_id: @current_user.id, team_id: @team.id, team_name: @team.team_name)
				end
			else
				@team = Team.find(params[:team_id])
				@tournament.participant_teams.create!(user_id: @current_user.id, team_id: @team.id, team_name: @team.team_name)
				render json: {success: true}
			end
		rescue Exception => e
			render json: {error: true, errors: e.message}, status: :unprocessable_entity
		end
	end

	private
	def team_params
		debugger
		params.require(:team).permit!
	end
end