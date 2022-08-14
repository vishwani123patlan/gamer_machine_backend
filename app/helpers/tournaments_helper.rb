module TournamentsHelper

	def all_games(user_id)
		Game.where(gameable_id: user_id).map{|game| [game.name, game.id]}
	end
end
