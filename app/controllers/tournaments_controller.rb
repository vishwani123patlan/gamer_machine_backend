class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.includes(:tournamentable, :game, :participant_teams).all
  end

  def new
  end

  def edit
  end

  def show
  end
end
