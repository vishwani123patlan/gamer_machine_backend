class Game < ApplicationRecord

	belongs_to :gameable, polymorphic: true
end
