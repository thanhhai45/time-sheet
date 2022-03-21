# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Mon
Price.create(date_of_week: 1, start_time: '07:00', end_time: '19:00', price_inside_time: 22.to_f, price_outside_time: 34.to_f) 
# Tue
Price.create(date_of_week: 2, start_time: '05:00', end_time: '17:00', price_inside_time: 25.to_f, price_outside_time: 35.to_f) 
# Wed
Price.create(date_of_week: 3, start_time: '07:00', end_time: '19:00', price_inside_time: 22.to_f, price_outside_time: 34.to_f) 
# Thur
Price.create(date_of_week: 4, start_time: '05:00', end_time: '17:00', price_inside_time: 25.to_f, price_outside_time: 35.to_f) 
# Fri
Price.create(date_of_week: 5, start_time: '07:00', end_time: '19:00', price_inside_time: 22.to_f, price_outside_time: 34.to_f) 
# Sat
Price.create(date_of_week: 6, start_time: '00:00', end_time: '23:59', price_inside_time: 47.to_f, price_outside_time: 47.to_f) 
# Sun
Price.create(date_of_week: 0, start_time: '00:00', end_time: '23:50', price_inside_time: 47.to_f, price_outside_time: 47.to_f) 
