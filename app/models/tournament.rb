class Tournament < ApplicationRecord
	belongs_to :tournamentable, polymorphic: true
	belongs_to :game
	has_many :participant_teams
	has_many :matches
	has_many :groups

	#VALIDATIONS
	validates :name, :start_date, :end_date, presence: true
end
