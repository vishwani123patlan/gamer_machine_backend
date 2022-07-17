class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.references :user, null: false, index: true
      t.string :team_name
      t.integer :players, array: true, default: []

      t.timestamps
    end
  end
end
