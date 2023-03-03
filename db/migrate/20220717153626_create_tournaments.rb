class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.bigint  :tournamentable_id
      t.string  :tournamentable_type
      t.bigint :game_id, index: true
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :entry_fee, default: 0
      t.decimal :winner_1_prize, default: 0
      t.decimal :winner_2_prize, default: 0
      t.decimal :winner_3_prize, default: 0
      t.integer :no_of_winners, default: 0
      t.integer :max_team, default: 0
      
      t.timestamps
    end
  end
end
