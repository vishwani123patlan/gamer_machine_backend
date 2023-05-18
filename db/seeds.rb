# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# SuperAdmin.find_or_create_by(id: 1, email: 'admin@game.com', encrypted_password: '12456')

# # Generate 5 super admins
# 10.times do
#   SuperAdmin.create(
#     email: Faker::Internet.email,
#     encrypted_password: "123456",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     phone_number: Faker::PhoneNumber.phone_number,
#     confirmation_token: Faker::Internet.uuid,
#     confirmed_at: Faker::Time.between(from: DateTime.now, to: DateTime.now),
#     confirmation_sent_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now - 1)
#   )
# end

# # Generate 10 users
# 10.times do
#   User.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: "Vishu@123",
#     is_verified: Faker::Boolean.boolean,
#     role: ["admin", "user"].sample,
#     phone_number: Faker::PhoneNumber.phone_number,
#     is_google_account: Faker::Boolean.boolean
#   )
# end

# game_types = ["Action", "Adventure", "Arcade", "Board", "Card", "Casino", "Casual", "Educational", "Music", "Puzzle", "Racing", "Role Playing", "Simulation", "Sports", "Strategy", "Trivia", "Word"]

# game_types.each do |game_type|
# 	game_typ = GameType.find_or_create_by(game_type: game_type)
# end

# 10.times do 
# 	Game.create(
#     gameable_id: Faker::Number.between(from: 1, to: 10),
#     gameable_type: ["SuperAdmin", "User"].sample,
#     name: Faker::Game.title,
#     game_type_id: Faker::Number.between(from: 1, to: game_types.count)
#   )
# end

# Define the possible status options
STATUS_OPTIONS = ['pending', 'running', 'completed', "cancled"]

# Generate 10 tournaments
100.times do
  Tournament.create(
    tournamentable_id: Faker::Number.between(from: 1, to: 10),
    tournamentable_type: ["SuperAdmin", "User"].sample,
    game_id: Faker::Number.between(from: 1, to: 10),
    name: Faker::Esport.event,
    start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now + 5.days),
    end_date: Faker::Time.between(from: DateTime.now + 6.days, to: DateTime.now + 20.days),
    entry_fee: Faker::Number.decimal(l_digits: 2),
    winner_1_prize: Faker::Number.decimal(l_digits: 4),
    winner_2_prize: Faker::Number.decimal(l_digits: 3),
    winner_3_prize: Faker::Number.decimal(l_digits: 2),
    no_of_winners: Faker::Number.between(from: 1, to: 3),
    max_team: [10,25,50,100].sample,
    status: STATUS_OPTIONS.sample # randomly select one of the options
  )
end


# games = Game.all.pluck(:id)
# User.find_or_create_by!(id: 1, first_name: 'user1', last_name: 'name', email: 'user@gmail.com', password_digest: '123456', phone_number: '9876543211', role: 'user')
# user  = SuperAdmin.first
# if user.present?
# 	(1..50).each do |num|
# 		tounament = Tournament.new(name: SecureRandom.hex(4), game_id: games.sample, tournamentable_id: user.id, tournamentable_type: "SuperAdmin", no_of_winners: [1,2,3].sample, entry_fee: [250, 500, 700, 1000].sample, winner_1_prize: 2100, max_team: [25, 100, 50].sample, status: ["pending", "completed", "cancled", "running"].sample, start_date: (Date.today + [3,4,6,7,8,8,10].sample.day), end_date: (Date.today + [24,25,26,23,26,29,30].sample.days))
# 		tounament.save!
# 	end
# end
