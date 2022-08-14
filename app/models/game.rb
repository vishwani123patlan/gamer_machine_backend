class Game < ApplicationRecord
	belongs_to :gameable, polymorphic: true
	belongs_to :game_type
	has_many :tournaments, dependent: :destroy
	validates :name, presence: true
	validates :name, uniqueness: true
end
