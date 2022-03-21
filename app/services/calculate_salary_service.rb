class CalculateSalaryService
  def initialize(entry)
    @entry_date = entry.date_of_entry
    @entry_start_time = "#{entry.date_of_entry} #{entry.start_time}".to_time
    @entry_finish_time = "#{entry.date_of_entry} #{entry.finish_time}".to_time
    @time_rule = Price.where(date_of_week: @entry_date.wday).first
    @start_time_rule = "#{entry.date_of_entry} #{@time_rule.start_time}".to_time
    @end_time_rule = "#{entry.date_of_entry} #{@time_rule.end_time}".to_time
  end

  def exec
    total_number_inside = number_time_have_any_inside_rule
    total_number_outside = number_time_have_any_outside_rule

    total_number_inside = 0 if total_number_inside.negative?
    total_number_outside = 0 if total_number_outside.negative?

    price_inside_time = total_number_inside * @time_rule.price_inside_time
    price_outside_time = total_number_outside * @time_rule.price_outside_time

    price_inside_time.to_f + price_outside_time.to_f
  end

  def number_time_have_any_inside_rule
    time_number = 0
    if (@entry_finish_time < @end_time_rule) && (@entry_start_time > @start_time_rule)
      time_number += duration_time(@entry_start_time, @entry_finish_time)
    elsif (@entry_finish_time < @end_time_rule) && (@entry_start_time < @start_time_rule)
      time_number += duration_time(@start_time_rule, @entry_finish_time)
    elsif (@entry_finish_time > @end_time_rule) && (@entry_start_time > @start_time_rule)
      time_number += duration_time(@entry_start_time, @end_time_rule)
    elsif (@entry_finish_time > @end_time_rule) && (@entry_start_time < @start_time_rule)
      time_number += duration_time(@start_time_rule, @end_time_rule)
    end
    time_number
  end

  def number_time_have_any_outside_rule
    time_number = 0
    if (@entry_start_time < @start_time_rule) && (@entry_finish_time > @end_time_rule)
      time_number += duration_time(@entry_start_time, @start_time_rule)
      time_number += duration_time(@end_time_rule, @entry_finish_time)
    elsif (@entry_start_time < @end_time_rule) && (@entry_finish_time > @end_time_rule)
      time_number += duration_time(@end_time_rule, @entry_finish_time)
    elsif (@entry_start_time > @end_time_rule) && (@entry_finish_time > @end_time_rule)
      time_number += duration_time(@entry_start_time, @entry_finish_time)
    elsif (@entry_start_time > @end_time_rule) && (@entry_finish_time < @start_time_rule)
      time_number += duration_time(@entry_start_time, @entry_finish_time)
    elsif (@entry_start_time < @start_time_rule) && (@entry_finish_time < @start_time_rule)
      time_number += duration_time(@entry_start_time, @entry_finish_time)
    end
    time_number
  end

  def duration_time(from, to)
    duration = to - from
    time_number = 0

    hour = (duration / 3600).floor
    rest_duration = duration % 3600
    time_number += hour
    return time_number if rest_duration.floor.zero?

    minutes = (rest_duration / 60).floor
    time_number += minutes.to_f / 60.00

    time_number
  end
end
