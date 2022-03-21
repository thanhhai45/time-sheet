require 'rails_helper'

RSpec.describe Timesheet, type: :model do
  describe 'timesheet' do
    it 'return error when timesheet all data blank' do
      record = Timesheet.new
      record.valid?

      expect(record.errors[:date_of_entry]).to include("can't be blank")
      expect(record.errors[:start_time]).to include("can't be blank")
      expect(record.errors[:finish_time]).to include("can't be blank")
    end

    it 'return error when timesheet start time blank' do
      timesheet = Timesheet.new(
        date_of_entry: '20/03/2022',
        start_time: '',
        finish_time: '17:00',
        total_price: 0
      )
      expect(timesheet).to_not be_valid
    end

    it 'return error when timesheet finish time blank' do
      timesheet = Timesheet.new(
        date_of_entry: '20/03/2022',
        start_time: '10:00',
        finish_time: '',
        total_price: 0
      )
      expect(timesheet).to_not be_valid
    end

    it 'return error when timesheet in future' do
      timesheet = Timesheet.new(
        date_of_entry: '20/04/2022',
        start_time: '10:00',
        finish_time: '17:00',
        total_price: 0
      )

      expect(timesheet).to_not be_valid
    end

    it 'return error when finish earlier than start time' do
      timesheet = Timesheet.new(
        date_of_entry: '20/03/2022',
        start_time: '15:00',
        finish_time: '10:00',
        total_price: 0
      )

      expect(timesheet).to_not be_valid
    end
  end

  describe 'timesheet overlap' do
    before(:all) do 
      Timesheet.first_or_create!(
        date_of_entry: '20/03/2022',
        start_time: '08:00',
        finish_time: '20:00',
        total_price: 0
      )
    end 

    it 'Overlapping 1' do
      timesheet = Timesheet.new(
        date_of_entry: '20/03/2022',
        start_time: '09:00',
        finish_time: '19:00',
        total_price: 0
      )
      expect(timesheet).to_not be_valid
    end
    it 'Overlapping 2' do
      timesheet = Timesheet.new(
        date_of_entry: '20/03/2022',
        start_time: '09:00',
        finish_time: '21:00',
        total_price: 0
      )
      expect(timesheet).to_not be_valid
    end
    it 'Overlapping 3' do
      timesheet = Timesheet.new(
        date_of_entry: '20/03/2022',
        start_time: '08:00',
        finish_time: '19:00',
        total_price: 0
      )
      expect(timesheet).to_not be_valid
    end
    it 'Overlapping 3' do
      timesheet = Timesheet.new(
        date_of_entry: '20/03/2022',
        start_time: '08:00',
        finish_time: '21:00',
        total_price: 0
      )
      expect(timesheet).to_not be_valid
    end
  end
end