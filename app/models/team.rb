class Team < ApplicationRecord
	t.references :user, null: false, index: true
	t.string :team_name
	t.integer :players, array: true, default: []
end
