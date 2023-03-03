class TournamentRegistrationsController < ApplicationController
	before_action :set_tournament
	before_action :set_teams

	def new
		@participant_team = @tournament.participant_teams.new
	end

	def create
		ParticipantTeam.transaction do
			@participant_team = @tournament.participant_teams.new(participant_team_params)
			@participant_team.participantable = current_super_admin
			respond_to do |format|
	      if @participant_team.save
	        format.html { redirect_to tournament_path(@tournament), notice: "Your participation for tournament was successfull." }
	      else
	        format.html { render :new, status: :unprocessable_entity }
	      end
	    end
		end
	end

	private
	def participant_team_params
		params.require(:participant_team).permit(:team_id, :tournament_id)
	end

	def participant_team_params_players
		params[:participant_team].permit(team_attributes: [:team_name, players_attributes: [:name, :phone_number]])
	end

	def set_teams
		@teams = current_super_admin.teams.includes(:players)
	end

	def set_tournament
		@tournament = Tournament.find params[:tournament_id]
	end
end
