module Api
	module V1
		module Admin
			class GamesController < Api::V1::ApiController
				before_action :authorize_request
				#before_action :is_admin
				before_action :set_game, only: [:show, :update, :destroy]

				def index
					begin
						@games = @current_user.games.includes(:game_type)
						game_serializer = @games.map{|game| Api::V1::Admin::GameSerializer.new(game).serializable_hash}
						render json: {success: true, games: game_serializer}
					rescue Exception => e
						render json: { error: e.message }, status: :unprocessable_entity
					end
				end

				def get_all_games
					begin
						
						# Fetch games created by current user or super admins
						games = Game.joins("LEFT OUTER JOIN users ON gameable_type = 'User' AND gameable_id = users.id")
						            .joins("LEFT OUTER JOIN super_admins ON gameable_type = 'SuperAdmin' AND gameable_id = super_admins.id")
						            .where("(gameable_type = 'User' AND gameable_id = ?) OR super_admins.id IS NOT NULL", @current_user.id)
						            .select("games.*")
						# Group games by gameable_type
						games_by_type = games.group_by(&:gameable_type)

						# Build the result hash
						games_hash = {
						  super_admin_games: games_by_type['SuperAdmin']&.map{|game| {id: game.id, name: game.name}} || [],
						  your_games: games_by_type['User']&.map{|game| {id: game.id, name: game.name}} || []
						}

						render json: {success: true, games_data: games_hash}
					rescue Exception => e
						render json: {success: false, errors: e.message}, status: :unprocessable_entity
					end
				end

				def create
					begin
						@game = Game.new(game_params)
						@game.gameable = @current_user
						#@game.game_logo = game_params["game_logo"] if game_params["game_logo"].present?
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
					params.require(:game).permit(:id, :name, :game_type_id, :game_logo)
				end
			end
		end
	end
end
