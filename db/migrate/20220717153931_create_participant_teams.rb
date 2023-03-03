class CreateParticipantTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :participant_teams do |t|
      t.bigint :participantable_id
      t.string :participantable_type
      t.bigint :tournament_id, index: true
      t.bigint :team_id, index: true
      t.string :team_name
      t.boolean :is_grouped, default: false

      t.timestamps
    end
  end
end
