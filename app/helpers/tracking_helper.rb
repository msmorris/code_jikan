module TrackingHelper
  def duration(time_clock)
    if time_clock.ended
      hour_test = ((time_clock.ended - time_clock.started) / 60).to_i
      if hour_test > 60
        "#{number_with_precision(((time_clock.ended - time_clock.started)/ 1.hour).to_f, precision: 2)} hours"
      else
        "#{number_with_precision(((time_clock.ended - time_clock.started)/ 1.minute).to_f, precision: 2)} minutes"
      end

    else
      "Active Timer Running"
    end
  end
end
