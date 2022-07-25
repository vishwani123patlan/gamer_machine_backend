class AddGameTypeIdInGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :game_type
    add_column :games, :game_type_id, :integer, null: false
  end
end
