class Game < ApplicationRecord
	mount_uploader :game_logo, GameLogoUploader
	belongs_to :gameable, polymorphic: true
	belongs_to :game_type
	has_many :tournaments, dependent: :destroy
	validates :name, presence: true
	#validates :name, uniqueness: true

	# def logo_will_change!
 #    super
 #    self.logo.cache! if logo.present?
 #  end
end
