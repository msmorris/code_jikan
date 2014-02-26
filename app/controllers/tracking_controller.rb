class TrackingController < ApplicationController
  before_filter :authenticate_user!

  def index
    @time_clocks = TimeClock.where(:user => current_user)
    @time_clocks.each do |clock|
      if clock.active
        @active = clock
      end
    end
  end

  def start
    @time_clock = TimeClock.new
    @time_clock.start(current_user)
    if @time_clock.save
      redirect_to tracking_path, :notice => "Tracking started."
    end
  end

  def stop
    @time_clock = TimeClock.find(params[:id])
    @time_clock.stop
    if @time_clock.save
      redirect_to tracking_path, :notice => "Tracking stopped."
    end
  end
end
