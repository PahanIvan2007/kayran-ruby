class PointsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_point, only: [:show, :edit, :update, :destroy, :qr]

  def index
    @points = Point.includes(:franchise).order(:title)
  end

  def show
    @boats = @point.boats
    @events = @point.events.upcoming
  end

  def new
    @point = Point.new
  end

  def edit
  end

  def create
    @point = Point.new(point_params)

    if @point.save
      redirect_to @point, notice: t(".created")
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @point.update(point_params)
      redirect_to @point, notice: t(".updated")
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @point.destroy!
    redirect_to points_path, notice: t(".destroyed")
  end

  def qr
    @qr = RQRCode::QRCode.new(point_url(@point))
  end

  private

  def set_point
    @point = Point.find(params[:id])
  end

  def point_params
    params.require(:point).permit(:title, :point_type, :franchise_id, :address, :lat, :lng, :timezone, :status)
  end
end
