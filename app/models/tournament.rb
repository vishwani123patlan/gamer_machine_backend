class Tournament < ApplicationRecord
	belongs_to :tournamentable, polymorphic: true
	belongs_to :game
	has_many :participant_teams, dependent: :destroy
	has_many :matches, dependent: :destroy
	has_many :groups, dependent: :destroy

	#SCOPES
	scope :pending, -> { where(status: 'pending')}

	#VALIDATIONS
	validates :name, :start_date, :end_date, presence: true

	NO_OF_WINNERS = {
		1 => 1,
		2 => 2,
		3 => 3
	}

	MAX_TEAM = {
		'25' => 25,
		'50' => 50,
		'100' => 100
	}

	STATUS = {
		'Pending' => 'pending',
		'Running' => 'running',
		'Completed' => 'completed',
		'Cancled' => 'cancled'
	}
end
