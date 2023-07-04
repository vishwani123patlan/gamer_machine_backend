class AddBannerToTournaments < ActiveRecord::Migration[6.1]
  def change
    add_column :tournaments, :banner, :string
    add_column :tournaments, :platform, :string
  end
end
