class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :group, index: true
      t.integer :tournament_id
      t.integer :high_scorer_team, array: true, default: []
      t.string :match_type, default: ""
      t.datetime :match_date
      t.jsonb :scoreboard, default: {}

      t.timestamps
    end
  end
end
