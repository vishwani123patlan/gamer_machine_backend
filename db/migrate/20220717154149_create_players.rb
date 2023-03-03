class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.bigint :playerable_id
      t.string :playerable_type
      t.string  :name
      t.string :phone_number

      t.timestamps
    end
  end
end
