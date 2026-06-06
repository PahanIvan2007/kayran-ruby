class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_match, only: [:show, :update]

  def index
    @matches = Match.includes(:team_a, :team_b, :event).order(start_time: :desc).limit(50)
  end

  def show
  end

  def update
    if @match.update(match_params)
      redirect_to @match, notice: "Матч обновлён"
    else
      render :show, status: :unprocessable_content
    end
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:score_a, :score_b, :status)
  end
end
