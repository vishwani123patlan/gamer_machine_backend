class TournamentRegistrationService
	def initialize(tournament, current_user)
		@tournament = tournament
		@current_user = current_user
	end

	def register_for_tournament(params)
		Rails.logger.debug "-----> TournamentRegistrationService: Start Registeration"
		if (params[:team_type] == 1)
			if params[:team_id].present? 
				register_for_tournament_with_existing_team(params[:team_id])
			end
		end
	end

	def register_for_tournament_with_existing_team(team_id)
		Rails.logger.debug "-----> TournamentRegistrationService: Register for extisting team with teamId #{team_id}"
		begin
			@team = Team.find(team_id)
			@participant_team = ParticipantTeam.new(team_id: @team.id, team_name: @team.team_name, tournament_id: @tournament.id, user_id: @current_user.id)
			if @participant_team.save
				return {success: true,participant_team: @participant_team}
			else
				return {success: false, errors: @participant_team.errors.full_messages}
			end
		rescue Exception => e
			return {success: false, errors: e.message}
		end
	end

end