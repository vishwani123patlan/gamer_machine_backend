class Api::V1::TournamentSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :entry_fee, :max_team, 
  :no_of_winners, :winner_1_prize, :winner_2_prize, :winner_3_prize, :participant_teams

  def start_date
  	object&.start_date&.strftime("%d-%m-%Y")
  end

  def end_date
  	object&.end_date&.strftime("%d-%m-%Y")
  end

end
