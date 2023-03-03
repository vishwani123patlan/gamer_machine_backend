class AddIsGoogleAccountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_google_account, :boolean, default: false
  end
end
