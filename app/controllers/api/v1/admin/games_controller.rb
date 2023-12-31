module Api
	module V1
		module Admin
			class GamesController < Api::V1::ApiController
				before_action :authorize_request
				before_action :is_admin
				before_action :set_game, only: [:show, :update, :destroy]

				def index
					begin
						@games = Game.where(gameable_id: @current_user.id)
						game_serializer = @games.map{|game| Api::V1::Admin::GameSerializer.new(game).serializable_hash}
						render json: {success: true, games: game_serializer}
					rescue Exception => e
						render json: { error: e.message }, status: :unprocessable_entity
					end
				end

				def create
					begin
						@game = Game.new(game_params)
						@game.gameable = @current_user
						if @game.save
							render json: {success: true, data: {game: @game}, message: 'Game Created Successfully!'}
						else
							render json: { error: @game.errors.full_messages }, status: :unprocessable_entity
						end
					rescue Exception => e
						render json: { error: e.message }, status: :unprocessable_entity
					end
				end


				def show
					begin
						if @game.present?
							render json: {success: true, game: @game}
						else
							render json: {error: 'Game not Found'}, status: :unprocessable_entity
						end
					rescue Exception => e
						render json: {error: e.message}, status: :unprocessable_entity
					end
				end


				def update
					begin
						if @game.update(game_params)
							render json: {success: true, message: 'Game Updated Successfully!'}
						else
							render json: { error: @game.errors.full_messages }, status: :unprocessable_entity
						end
					rescue Exception => e
						render json: { error: e.message }, status: :unprocessable_entity
					end
				end

				def destory
					begin
						if @game.destory
							render json: {success: true, message: 'Game Deleted Successfully!'}
						else
							render json: { error: @game.errors.full_messages }, status: :unprocessable_entity
						end
					rescue Exception => e
						render json: { error: e.message }, status: :unprocessable_entity
					end
				end

				def game_types
					begin
						@game_types = GameType.all.map{|game_type| Api::V1::Admin::GameTypesSerializer.new(game_type).serializable_hash}
						render json: {success: true, game_types: @game_types}
					rescue Exception => e
						render json: { error: e.message }, status: :unprocessable_entity
					end
				end

				private

				def set_game
					@game = Game.find(params[:id])
					render json: {error: 'Game Not Found'} if @game.nil?
				end

				def game_params
					new_params = ActionController::Parameters.new(JSON.parse(params.require(:game)))
					new_params.permit(:name, :game_type_id)
				end
			end
		end
	end
end
