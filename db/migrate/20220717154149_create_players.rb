class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.references :team, null: false, index: true
      t.string  :name
      t.boolean :is_captain, default: false
      t.string :phone_number

      t.timestamps
    end
  end
end
