class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.bigint :gameable_id
      t.string :gameable_type
      t.string :name
      t.bigint :game_type_id, index: true

      t.timestamps
    end
  end
end
