class Team < ApplicationRecord
	has_many :teams_palyers, class_name: 'TeamsPlayer'
	has_many :players, through: :teams_palyers, dependent: :destroy
	
	def save(params)
    return false if invalid?

    ActiveRecord::Base.transaction do
      @team = Team.create!(team_name: team_name, user_id: user_id)
      params[:players].each do |player|
      	@team.players.create!(name: player[:name], phone_number: player[:phone_number], user_id: @team.user_id)
    	end
      if params[:existing_players].present?
        params[:existing_players].each do |existing_player_id|
          TeamsPlayer.create!(team_id: @team.id, player_id: existing_player_id)
        end
      end
    end

    return @team
  rescue ActiveRecord::StatementInvalid => e
    # Handle exception that caused the transaction to fail
    # e.message and e.cause.message can be helpful
    errors.add(:base, e.message)

    false
  end
end
