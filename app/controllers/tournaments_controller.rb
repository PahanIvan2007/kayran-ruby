class TournamentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]

  def index
    @tournaments = Tournament.includes(:event).order(created_at: :desc)
  end

  def show
    @matches = @tournament.matches.includes(:team_a, :team_b)
  end

  def new
    @tournament = Tournament.new
  end

  def edit
  end

  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      redirect_to @tournament, notice: "Турнир создан"
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @tournament.update(tournament_params)
      redirect_to @tournament, notice: "Турнир обновлён"
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @tournament.destroy!
    redirect_to tournaments_path, notice: "Турнир удалён"
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  def tournament_params
    params.require(:tournament).permit(:title, :event_id, :format, :status)
  end
end
