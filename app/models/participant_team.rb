class ParticipantTeam < ApplicationRecord
	belongs_to :participantable, polymorphic: true
	belongs_to :team
	belongs_to :tournament
	accepts_nested_attributes_for :team, allow_destroy: true

	validates :team_id, uniqueness: true
end
