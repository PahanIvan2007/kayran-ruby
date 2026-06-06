class GpsTracksController < ApplicationController
  before_action :authenticate_user!

  def index
    @gps_tracks = GpsTrack.includes(:user, :event).order(created_at: :desc).limit(50)
  end

  def show
    @gps_track = GpsTrack.find(params[:id])
    @points = @gps_track.gps_track_points.order(:timestamp)
  end
end
