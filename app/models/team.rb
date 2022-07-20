class Team < ApplicationRecord
	
	has_and_belongs_to_many :players, join_table: :teams_palyers,  dependent: :nullify
	
	def save(params)
    return false if invalid?

    ActiveRecord::Base.transaction do
      @team = Team.create!(team_name: team_name, user_id: user_id)
      params[:players].each do |player|
      	@team.players.create!(name: player[:name], phone_number: player[:phone_number], user_id: @team.user_id)
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
