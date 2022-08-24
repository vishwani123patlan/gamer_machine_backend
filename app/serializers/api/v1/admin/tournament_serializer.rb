class Api::V1::Admin::TournamentSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :entry_fee, :max_team, 
  :no_of_winners, :status, :winner_1_prize, :winner_2_prize, :winner_3_prize, :participant_teams
  
  def participant_teams
  	object.participant_teams.map do |participant_team|
  		{data: participant_team, team: Api::V1::TeamSerializer.new(participant_team.team)}
  	end
  end

  attribute :total_participants do |object|
  	object.participant_teams.count
  end

  def start_date
    object&.start_date&.strftime("%d-%m-%Y")
  end

  def end_date
    object&.end_date&.strftime("%d-%m-%Y")
  end

  belongs_to :game
end