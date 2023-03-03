class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.bigint :teamable_id
      t.string :teamable_type
      t.string :team_name
      t.integer :captain_id
      
      t.timestamps
    end
  end
end
