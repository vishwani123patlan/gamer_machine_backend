class User < ApplicationRecord
	require "securerandom"

	has_secure_password

	has_many :teams, as: :teamable, dependent: :destroy
	has_many :games, as: :gameable, dependent: :destroy
	
	validates :email, uniqueness: true
	validates :email, :first_name, :last_name, :role, presence: true

	def name
		"#{first_name} #{last_name}"
	end
end
