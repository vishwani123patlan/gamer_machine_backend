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
					render json: {success: false, errors: e.message }, status: :unprocessable_entity
				end
			end

			def create
				begin
					@team = Team.new(team_params.except(:players, :existing_players))
					@team.user_id = @current_user.id
					team = @team.save(team_params)
					if team.present?
						team_serializer = TeamSerializer.new(team)
						render json: {success: true, team: team_serializer, message: 'Team Created Successfuly!'}
					else
						render json: {success: false, errors: team.errors.full_messages}, status: :unprocessable_entity
					end
				rescue Exception => e
					render json: {success: false, errors: e.message }, status: :unprocessable_entity
				end
			end

			private
			def team_params
				params.require(:team).permit!
			end
		end
	end
end