class CreateTeamsPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :teams_players do |t|
      t.belongs_to :team, index: true
      t.belongs_to :player, index: true
      t.timestamps
    end
  end
end
