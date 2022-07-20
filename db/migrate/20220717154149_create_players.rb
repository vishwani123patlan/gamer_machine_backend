class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.references :user, null: false, index: true
      t.string  :name
      t.string :phone_number

      t.timestamps
    end
  end
end
