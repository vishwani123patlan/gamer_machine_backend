class AddStatusToTournaments < ActiveRecord::Migration[6.1]
  def change
    add_column :tournaments, :status, :string, default: ""
  end
end
