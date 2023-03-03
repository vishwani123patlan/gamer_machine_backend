class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.integer :tournament_id, index: true
      t.integer :participant_teams_ids, array: true, default: []
      t.integer :no_of_winners
      t.integer :winners_ids, array: true, default: []

      t.timestamps
    end
  end
end
