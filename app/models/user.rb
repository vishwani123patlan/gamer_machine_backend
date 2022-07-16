class User < ApplicationRecord
	require "securerandom"

	has_secure_password

	validates :email, uniqueness: true
	validates :email, :first_name, :last_name, :role, :phone_number, presence: true


	def name
		"#{first_name} #{last_name}"
	end
end
