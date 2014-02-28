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

  def earned_amount(time_clocks)
    amount = []
    time_clocks.each do |clock|
      if clock.ended
        amount << ((clock.ended - clock.started) / 1.hour)
      end
    end

    hours = amount.inject { |sum, x| sum + x }

    # Let's earn $40 per hour.
    if hours
      "$#{number_with_precision((hours * 40), precision: 2)} earned at $40 per hour."
    end
  end
end
