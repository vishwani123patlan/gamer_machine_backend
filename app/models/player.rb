class Player < ApplicationRecord
	has_many :teams_palyers, class_name: 'TeamsPlayer'
	has_many :teams, through: :teams_palyers, dependent: :destroy
end
