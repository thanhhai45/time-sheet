FactoryBot.define do
  factory :price_mon, class: Price do
    date_of_week { 1 }
    start_time { '07:00' }
    end_time { '19:00' }
    price_inside_time { 22.to_f }
    price_outside_time { 34.to_f }
  end

  factory :price_tue, class: Price do
    date_of_week { 2 }
    start_time { '05:00' }
    end_time { '17:00' }
    price_inside_time { 25.to_f }
    price_outside_time { 35.to_f }
  end

  factory :price_wed, class: Price do
    date_of_week { 3 }
    start_time { '07:00' }
    end_time { '19:00' }
    price_inside_time { 22.to_f } 
    price_outside_time { 34.to_f }
  end

  factory :price_thur, class: Price do
    date_of_week { 4 }
    start_time { '05:00' }
    end_time { '17:00' }
    price_inside_time { 25.to_f } 
    price_outside_time { 35.to_f }
  end

  factory :price_fri, class: Price do
    date_of_week { 5 }
    start_time { '07:00' }
    end_time { '19:00' }
    price_inside_time { 22.to_f } 
    price_outside_time { 34.to_f }
  end

  factory :price_sat, class: Price do
    date_of_week { 6 }
    start_time { '00:00' }
    end_time { '23:59' }
    price_inside_time { 47.to_f } 
    price_outside_time { 47.to_f }
  end

  factory :price_sun, class: Price do
    date_of_week { 0 }
    start_time { '00:00' }
    end_time { '23:59' }
    price_inside_time { 47.to_f } 
    price_outside_time { 47.to_f }
  end
end
def seed_db
  create(:price_mon)
  create(:price_tue)
  create(:price_wed)
  create(:price_thur)
  create(:price_fri)
  create(:price_sat)
  create(:price_sun)
end
