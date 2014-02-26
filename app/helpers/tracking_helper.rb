module TrackingHelper
  def duration(time_clock)
    if time_clock.ended
      "#{number_with_precision(((time_clock.ended - time_clock.started)/ 1.hour).to_f, precision: 2)} hours"
    else
      nil
    end
  end
end
