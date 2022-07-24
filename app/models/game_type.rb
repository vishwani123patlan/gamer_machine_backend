class GameType < ApplicationRecord
	validates :game_type, presence: true
	validates :game_type, uniqueness: true
end
