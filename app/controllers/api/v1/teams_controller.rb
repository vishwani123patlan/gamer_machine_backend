module Api
	module V1
		class TeamsController < Api::V1::ApiController
			before_action :authorize_request

			def index
				begin
					@teams = Team.where(user_id: @current_user.id)
					#teams_serializer = TeamSerializer.new(@teams).serializable_hash
					teams_serializer = @teams.map{|team| TeamSerializer.new(team).serializable_hash}
					render json: {success: true, teams: teams_serializer}
				rescue Exception => e
					render json: { error: e.message }, status: :unprocessable_entity
				end
			end

			def create
				begin
					@team = Team.new(team_params.except(:players))
					@team.user_id = @current_user.id
					team = @team.save(team_params)
					if team.present?
						team_serializer = TeamSerializer.new(team)
						render json: {success: true, team: team_serializer}
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
	end
end