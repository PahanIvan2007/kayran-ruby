class RoutesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.includes(:route_points).order(:title)
  end

  def show
    @route_points = @route.route_points.order(:order_index)
  end

  def new
    @route = Route.new
    @route.route_points.build
  end

  def edit
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to @route, notice: t(".created")
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @route.update(route_params)
      redirect_to @route, notice: t(".updated")
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @route.destroy!
    redirect_to routes_path, notice: t(".destroyed")
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:title, :description, :difficulty, :distance_km, :estimated_duration, :route_type, :status,
      route_points_attributes: [:id, :order_index, :lat, :lng, :title, :description, :checkpoint_type, :_destroy])
  end
end
