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
    notice_message = ""
    @time_clocks = TimeClock.where(:user => current_user)
    @time_clocks.each do |clock|
      if clock.active
        notice_message = "You already have an active timer."
      end
    end

    if notice_message.blank?
      notice_message = "New timer created."
      time_clock = TimeClock.new
      time_clock.start(current_user)
    else
    end
    redirect_to tracking_path, :notice => notice_message
  end

  def stop
    @time_clock = TimeClock.find(params[:id])
    @time_clock.stop
    if @time_clock.save
      redirect_to tracking_path, :notice => "Tracking stopped."
    end
  end
end
