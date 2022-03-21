module TimesheetsHelper
  def show_time_format(time, format = "%H:%M")
    time.strftime(format)
  end

  def show_date_format(date, format = "%d/%m/%Y")
    date.strftime(format)
  end
end
