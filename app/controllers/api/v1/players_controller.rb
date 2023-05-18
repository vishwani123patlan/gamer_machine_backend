module Api
  module V1
    class PlayersController < Api::V1::ApiController
      before_action :authorize_request
      before_action :set_player, only: [:show, :update, :destroy]
      
      def index
        begin
          @players = Player.where(user_id: @current_user.id)
          players_serializer = @players.map{|player| PlayerSerializer.new(player).serializable_hash}
          render json: {success: true, players: players_serializer}
        rescue Exception => e
          render json: {success: false, errors: e.message}, status: :unprocessable_entity
        end
      end

      def show
        begin
          player_serializer = PlayerSerializer.new(@player).serializable_hash
          render json: {success: true, player: player_serializer}
        rescue Exception => e
          render json: {success: false, errors: e.message}, status: :unprocessable_entity
        end
      end

      def create
        begin
          @player = Player.new(players_params)
          @player.user_id = @current_user.id
          if @player.save
            player_serializer = PlayerSerializer.new(@player).serializable_hash
            render json: {success: true, player: player_serializer, message: 'Player Created Successfully'}
          else
            render json: {success: false, errors: @player.errors.full_messages}, status: :unprocessable_entity
          end
        rescue Exception => e
          render json: {success: false, errors: e.message}, status: :unprocessable_entity
        end
      end

      def update
        begin
          if @player.update(players_params)
            player_serializer = PlayerSerializer.new(@player).serializable_hash
            render json: {success: true, player: player_serializer}
          else
            render json: {success: false, errors: @player.errors.full_messages}, status: :unprocessable_entity
          end
        rescue Exception => e
          render json: {success: false, errors: e.message}, status: :unprocessable_entity
        end
      end

      def destroy
        begin
          if @player.destroy
            render json: {success: true, message: "Player Deleted Successfully"}
          else
            render json: {success: false, errors: @player.errors.full_messages}, status: :unprocessable_entity
          end
        rescue Exception => e
          render json: {success: false, errors: e.message}, status: :unprocessable_entity
        end
      end

      private

      def set_player
        begin
          @player = Player.find(params[:id])
        rescue Exception => e
          render json: {success: false, errors: e.message}, status: :unprocessable_entity
        end
      end

      def players_params
        params.require(:player).permit(:name, :phone_number)
      end
    end
  end
end
