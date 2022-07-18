class CreateTeamsPalyers < ActiveRecord::Migration[6.1]
  def change
    create_table :teams_palyers do |t|
      t.references :team, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.timestamps
    end
  end
end
