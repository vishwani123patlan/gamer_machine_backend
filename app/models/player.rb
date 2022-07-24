class Player < ApplicationRecord
	has_and_belongs_to_many :teams, join_table: :teams_palyers, dependent: :destroy
end
