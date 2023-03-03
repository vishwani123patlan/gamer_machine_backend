class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  def index
    @teams = current_super_admin.teams
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.teamable = current_super_admin
    respond_to do |format|
      if @team.save
        format.html {redirect_to teams_path, notice: "Team Added Successfully!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end

  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      deleted_players = team_params[:players_attributes].values.map{ |player| player[:id]}&.compact&.select{|id| id!= ""}
      players_need_to_deleted_ids = @team.players.where.not(id: deleted_players).pluck(:id)
      if @team.update(team_params)
        Player.where(id: players_need_to_deleted_ids).destroy_all
        format.html {redirect_to teams_path, notice: "Team Updated Successfully!" }
      else
        format.html {render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_team
    @team = Team.find params[:id]
  end

  def team_params
    params.require(:team).permit(:team_name, players_attributes: [:id, :name, :phone_number])
  end
end
