class RentalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rental, only: [:show, :update]

  def index
    @rentals = current_user.rentals.includes(:boat, :event).order(created_at: :desc)
  end

  def show
  end

  def new
    @rental = Rental.new
    @boats = Boat.where(status: :available)
  end

  def create
    @rental = current_user.rentals.build(rental_params)
    @rental.status = :active

    if @rental.save
      @rental.boat.update(status: :rented)
      Log.create!(user: current_user, event: @rental.event, action_type: "rental_created", entity_type: "Rental", entity_id: @rental.id)
      redirect_to @rental, notice: t(".created")
    else
      @boats = Boat.where(status: :available)
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @rental.update(rental_params)
      if @rental.completed? || @rental.cancelled?
        @rental.boat.update(status: :available)
      end
      redirect_to @rental, notice: t(".updated")
    else
      render :show, status: :unprocessable_content
    end
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:event_id, :boat_id, :start_time, :end_time, :status)
  end
end
