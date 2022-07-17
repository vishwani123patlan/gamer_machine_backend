class CreateParticipantTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :participant_teams do |t|
      t.references :user, null: false, index: true
      t.references :tournament, null: false, index: true
      t.references :team, null: false, index: true
      t.string :team_name
      t.boolean :is_grouped, default: false

      t.timestamps
    end
  end
end
