class Api::V1::GamesController < Api::V1::ApiController
	before_action :authorize_request
	before_action :set_game, only: [:show, :update, :destroy]
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

	private

	def set_game
		@game = Game.find(params[:id])
		render json: {error: 'Game Not Found'} if @game.nil?
	end

	def game_params
		params.require(:game).permit(:name, :game_type)
	end

end
