class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy, :qr]

  def index
    @events = Event.includes(:point, :user).order(start_time: :desc).limit(50)
  end

  def show
    @rentals = @event.rentals.includes(:user, :boat)
    @gps_tracks = @event.gps_tracks.includes(:user)
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: t(".created")
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: t(".updated")
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @event.destroy!
    redirect_to events_path, notice: t(".destroyed")
  end

  def qr
    @qr = RQRCode::QRCode.new(event_url(@event))
  end

  private

  def set_event
    @event = Event.includes(:point, :route, :user).find(params[:id])
  end

  def event_params
    params.require(:event).permit(:event_type, :title, :description, :start_time, :end_time, :point_id, :route_id, :status, :visibility)
  end
end
