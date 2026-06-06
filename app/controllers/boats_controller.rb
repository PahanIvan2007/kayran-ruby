class BoatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
    @boats = Boat.includes(:point).order(:serial_number)
    @boats = @boats.where(point_id: params[:point_id]) if params[:point_id].present?
    @boats = @boats.where(status: params[:status]) if params[:status].present?
  end

  def show
    @rentals = @boat.rentals.order(created_at: :desc).limit(10)
  end

  def new
    @boat = Boat.new
  end

  def edit
  end

  def create
    @boat = Boat.new(boat_params)

    if @boat.save
      redirect_to @boat, notice: t(".created")
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @boat.update(boat_params)
      redirect_to @boat, notice: t(".updated")
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @boat.destroy!
    redirect_to boats_path, notice: t(".destroyed")
  end

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:point_id, :serial_number, :color, :boat_type, :capacity, :status, :condition_level, :last_service_date)
  end
end
