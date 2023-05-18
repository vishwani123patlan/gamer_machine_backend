module Api
	module V1
		module Admin
			class TournamentsController < Api::V1::ApiController
				before_action :authorize_request
				#before_action :is_admin
				before_action :set_tournament, only: [:show, :update, :destroy]

				def index
					begin
						@tournaments = Tournament.all
						tournaments_serializer = @tournaments.map{|tournament| TournamentSerializer.new(tournament).serializable_hash}
						render json: {success: true, tournaments: tournaments_serializer}
					rescue Exception => e
						render json: {error: e.message}, status: :unprocessable_entity
					end
				end

				def create
					begin
						@tournament = Tournament.new(tournament_params)
						@tournament.tournamentable = @current_user
						if @tournament.save
							render json: {success: true, tournament: @tournament, message: 'Tournament created successfully!'}
						else
							render json: {sucess: false, error: @tournament.errors.full_messages&.first}, status: :unprocessable_entity
						end
					rescue Exception => e
						render json: {error: e.message}, status: :unprocessable_entity
					end
				end

				def show
					render json: {tournament: @tournament}
				end

				def update
					begin
						if @tournament.update(tournament_params)
							render json: {success: true, tournament: @tournament, message: 'Tournament updated successfully!'}
						else
							render json: {error: @tournament.errors.full_message}
						end
					rescue Exception => e
						render json: {error: e.message}, status: :unprocessable_entity
					end
				end

				def destroy
					begin
						if @tournament.destroy
							render json: {success: true, message: 'Tournament Deleted successfully!'}
						else
							render json: {error: @tournament.errors.full_message}
						end
					rescue Exception => e
						render json: {error: e.message}, status: :unprocessable_entity
					end
				end

				private

				def tournament_params
					params.require(:tournament).permit(:name, :game_id, :start_date, :end_date, :entry_fee, :winner_1_prize, :winner_2_prize, :winner_3_prize, :max_team, :no_of_winners, :status)
				end

				def set_tournament
					@tournament = Tournament.find(params[:id])
					render json: {error: 'Tournament not found'}, status: :unprocessable_entity if @tournament.nil?
				end
			end
		end
	end
end
