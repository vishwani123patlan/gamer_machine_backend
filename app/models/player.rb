class Player < ApplicationRecord
	has_and_belongs_to_many :teams, dependent: :destroy

	validates :name, uniqueness: true
end
