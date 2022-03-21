FactoryBot.define do
  factory :timesheet_15_04_2019, class: Timesheet do
    date_of_entry { '15/04/2019'.to_datetime }
    start_time { '10:00' }
    finish_time { '17:00' }
    total_price { 0 }
  end

  factory :timesheet_16_04_2019, class: Timesheet do
    date_of_entry { '16/04/2019'.to_datetime }
    start_time { '12:00' }
    finish_time { '20:15' }
    total_price { 0 }
  end

  factory :timesheet_17_04_2019_04, class: Timesheet do
    date_of_entry { '17/04/2019'.to_datetime }
    start_time { '04:00' }
    finish_time { '21:30' }
    total_price { 0 }
  end

  factory :timesheet_20_04_2019, class: Timesheet do
    date_of_entry { '20/04/2019'.to_datetime }
    start_time { '15:30' }
    finish_time { '20:00' }
    total_price { 0 }
  end

  factory :timesheet_17_04_2019_02, class: Timesheet do
    date_of_entry { '17/04/2019'.to_datetime }
    start_time { '02:00' }
    finish_time { '6:00' }
    total_price { 0 }
  end

  factory :timesheet_19_03_2022, class: Timesheet do
    date_of_entry { '19/03/2022'.to_datetime }
    start_time { '10:00' }
    finish_time { '17:00' }
    total_price { 0 }
  end
end
