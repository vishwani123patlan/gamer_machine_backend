module Api
	module V1
		class TournamentRegistrationsController < Api::V1::ApiController
			before_action :authorize_request, except: [:latest_tournaments]


			def latest_tournaments
			  @tournaments = Tournament.pending.order(:created_at).first(6)#.where("start_date >= ?", Date.today)
			  tournaments_serializer = @tournaments.map{|tournament| Api::V1::TournamentSerializer.new(tournament).serializable_hash}
			  render json: {success: true, tournaments: tournaments_serializer}
			end

			def create
				begin
					@tournament = Tournament.find(params[:tournament_id])
					@tournament_registration = TournamentRegistrationService.new(@tournament, @current_user)
					@participant_team = @tournament_registration.register_for_tournament(params)
					if @participant_team[:success]
						participant_team = @participant_team[:participant_team]
						participant_team_serializer = ParticipantTeamSerializer.new(participant_team)
						render json: {success: true, participant_team: participant_team_serializer, message: "Participation Done!"}
					else
						render json: @participant_team
					end
				rescue Exception => e
					render json: {success: false, errors: e.message}, status: :unprocessable_entity
				end
			end

			private
			def team_params
				params.require(:team).permit!
			end
		end
	end
end
