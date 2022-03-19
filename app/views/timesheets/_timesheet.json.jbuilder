json.extract! timesheet, :id, :date_of_entry, :start_time, :finish_time, :created_at, :updated_at
json.url timesheet_url(timesheet, format: :json)
