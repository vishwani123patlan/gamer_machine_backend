class Tournament < ApplicationRecord
	belongs_to :tournamentable, polymorphic: true
	belongs_to :game
	has_many :participant_teams, dependent: :destroy
	has_many :matches, dependent: :destroy
	has_many :groups, dependent: :destroy

	#VALIDATIONS
	validates :name, :start_date, :end_date, presence: true
end
