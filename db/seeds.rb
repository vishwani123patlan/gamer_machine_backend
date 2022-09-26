# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SuperAdmin.find_or_create_by(id: 1, email: 'admin@game.com', encrypted_password: '12456')

game_types = ["Action", "Adventure", "Arcade", "Board", "Card", "Casino", "Casual", "Educational", "Music", "Puzzle", "Racing", "Role Playing", "Simulation", "Sports", "Strategy", "Trivia", "Word"]

game_types.each do |game_type|
	game_typ = GameType.find_or_create_by(game_type: game_type)
end

games = Game.all.pluck(:id)
user  = User.first
if user.present?
	(1..50).each do |num|
		tounament = Tournament.new(name: SecureRandom.hex(4), game_id: games.sample, tournamentable_id: user.id, tournamentable_type: "User", no_of_winners: [1,2,3].sample, entry_fee: [250, 500, 700, 1000].sample, winner_1_prize: 2100, max_team: [25, 100, 50].sample, status: ["pending", "completed", "cancled", "running"].sample, start_date: (Date.today + [3,4,6,7,8,8,10].sample.day), end_date: (Date.today + [24,25,26,23,26,29,30].sample.days))
		tounament.save!
	end
end