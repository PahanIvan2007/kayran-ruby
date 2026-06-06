class FranchisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_franchise, only: [:show, :edit, :update, :destroy]

  def index
    @franchises = Franchise.includes(:owner).order(:title)
  end

  def show
    @points = @franchise.points
  end

  def new
    @franchise = Franchise.new
  end

  def edit
  end

  def create
    @franchise = Franchise.new(franchise_params)

    if @franchise.save
      redirect_to @franchise, notice: "Франшиза создана"
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @franchise.update(franchise_params)
      redirect_to @franchise, notice: "Франшиза обновлена"
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @franchise.destroy!
    redirect_to franchises_path, notice: "Франшиза удалена"
  end

  private

  def set_franchise
    @franchise = Franchise.find(params[:id])
  end

  def franchise_params
    params.require(:franchise).permit(:title, :owner_id, :status)
  end
end
