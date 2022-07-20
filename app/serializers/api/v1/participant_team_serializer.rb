class Api::V1::ParticipantTeamSerializer < ActiveModel::Serializer
  attributes :id, :team_name, :created_at, :updated_at
  belongs_to :tournament
  attributes :team do |object|
  	team = object.team
  	attributes :players do |object|
  		team.players
  	end
	end
end