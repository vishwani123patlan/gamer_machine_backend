class Game < ApplicationRecord
	belongs_to :gameable, polymorphic: true
	has_many :tournaments, dependent: :destroy
	validates :name, presence: true
end
