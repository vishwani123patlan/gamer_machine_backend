class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:edit, :show, :update, :destroy]
  def index
    @tournaments = Tournament.includes(:tournamentable, :game, :participant_teams).all
  end

  def new
    @tournament = Tournament.new
  end

  def edit
  end

  def show
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.tournamentable = current_super_admin
    respond_to do |format|
      if @tournament.save
        format.html { redirect_to tournament_path(@tournament), notice: "Tournament was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to tournament_path(@tournament), notice: "Tournament was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    respond_to do |format|
      if @tournament.destroy
        format.html { redirect_to tournaments_path, notice: "Tournament was successfully Deleted." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end



  private

  def set_tournament
    @tournament = Tournament.includes(:participant_teams).find(params[:id])
  end

  def tournament_params
    params.require(:tournament).permit(:name, :start_date, :end_date, :game_id, :status, :no_of_winners, :entry_fee, :max_team, :winner_1_prize, :winner_2_prize, :winner_3_prize)
  end
end
