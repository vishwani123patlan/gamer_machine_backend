class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false, unique: true, index: true, default: ""
      t.string :password_digest, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean :is_verified, default: false
      t.string :role
      t.string :phone_number

      t.timestamps
    end
  end
end
