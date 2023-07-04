class Tournament < ApplicationRecord
	belongs_to :tournamentable, polymorphic: true
	belongs_to :game
	has_many :participant_teams, dependent: :destroy
	has_many :matches, dependent: :destroy
	has_many :groups, dependent: :destroy

	mount_uploader :banner, BannerUploader

	#SCOPES
	scope :pending, -> { where(status: 'pending')}

	#VALIDATIONS
	validates :name, :start_date, :end_date, presence: true
	validates :end_date, comparison: { comparison_attr: :start_date, message: "must be greater than start date" }
  	validates :start_date, comparison: { comparison_attr: :end_date, operator: :<, message: "must be less than end date" }


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

	private

	def check_start_end_date
	    unless end_date > start_date
	    	debugger
	      errors.add(:end_date, "end date should be greater than start date")
	    end
 	end
end
