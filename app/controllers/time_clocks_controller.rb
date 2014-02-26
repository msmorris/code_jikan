class TimeClocksController < ApplicationController
  before_action :set_time_clock, only: [:edit, :update]

  def new
    @time_clock = TimeClock.new
  end

  def create
    @time_clock = TimeClock.new(time_clock_params)

    if @time_clock.save
      redirect_to tracking_path, notice: "Time Entry successfully created."
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @time_clock.update(time_clock_params)
      redirect_to tracking_path, notice: "Time Entry successfully updated."
    else
      render action: 'edit'
    end
  end

  def destroy
  end

  private
    def set_time_clock
      @time_clock = TimeClock.find(params[:id])
    end

    def time_clock_params
      logger.ap params
      params.require(:time_clock).permit(:started, :ended, :user_id)
    end
end
