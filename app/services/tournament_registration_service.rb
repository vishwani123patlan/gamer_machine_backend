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
		elsif(params[:team_type] == 2)
			register_for_tournament_with_new_team_and_player(params[:team])
		else
			register_for_tournament_by_super_admin(params)
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

	def register_for_tournament_with_new_team_and_player(team_params)
		Rails.logger.debug "-----> TournamentRegistrationService: Register for new teams and players with params #{team_params}"
		begin
			@team = Team.new(team_name: team_params[:team_name], user_id: @current_user.id)
			team = @team.save_team(team_params_permit(team_params))
			@participant_team = ParticipantTeam.new(team_id: team.id, team_name: team.team_name, tournament_id: @tournament.id, user_id: @current_user.id)
			if @participant_team.save
				return {success: true, participant_team: @participant_team}
			else
				return {success: false, errors: @participant_team.errors.full_messages}
			end
		rescue Exception => e
			return {success: false, errors: e.message}
		end
	end

	private

	def team_params_permit(params)
		return params.permit!
	end

end