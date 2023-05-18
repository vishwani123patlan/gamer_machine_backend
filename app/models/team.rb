class Team < ApplicationRecord
  belongs_to :teamable, polymorphic: true
	has_many :teams_palyers, class_name: 'TeamsPlayer'
	has_many :players, through: :teams_palyers, dependent: :destroy

  accepts_nested_attributes_for :players, allow_destroy: true
	
  validates :team_name, presence: true
  validates :team_name, uniqueness: true

	def save_team(params)
    return false if invalid?

    ActiveRecord::Base.transaction do
      @team = Team.create!(team_name: team_name, user_id: user_id)
      # params[:players] IS FOR API SECTION AND params[:players_attributes] IS FOR SUPER ADMIN SECTION
      if players = params[:players].presence || params[:players_attributes]&.to_h
        players.each do |player|
          @team.players.create(name: player[:name], phone_number: player[:phone_number], user_id: @team.user_id)
        end
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
   return  errors.add(:base, e.message)
  end
end
