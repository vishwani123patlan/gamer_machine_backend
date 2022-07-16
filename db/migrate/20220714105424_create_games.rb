class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.bigint :gameable_id
      t.string :gameable_type
      t.string :name
      t.string :game_type

      t.timestamps
    end
  end
end
