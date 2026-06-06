class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def index
    if user_signed_in?
      redirect_to dashboard_path
    end
    @events_upcoming = Event.upcoming.includes(:point).limit(5)
  end

  def dashboard
    @events_count = Event.count
    @active_events = Event.active_events.includes(:point).limit(10)
    @points_count = Point.where(status: :active).count
    @boats_available = Boat.where(status: :available).count
    @my_events = current_user.created_events.order(created_at: :desc).limit(5)
    @recent_rentals = current_user.rentals.order(created_at: :desc).limit(5)
  end
end
