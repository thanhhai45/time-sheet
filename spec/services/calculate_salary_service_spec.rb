require 'rails_helper'

RSpec.describe CalculateSalaryService do
  before(:all) do
    create(:price_mon)
    create(:price_tue)
    create(:price_wed)
    create(:price_thur)
    create(:price_fri)
    create(:price_sat)
    create(:price_sun)
  end
  describe '#exec 1' do
    it 'Calculate price with entry 15/04/2019' do
      timesheet = create(:timesheet_15_04_2019)
      price = CalculateSalaryService.new(timesheet).exec

      expect(price).to eq(154)
    end
  end
  describe '#exec 2' do
    it 'Calculate price with entry 16/04/2019' do
      timesheet = create(:timesheet_16_04_2019)
      price = CalculateSalaryService.new(timesheet).exec

      expect(price).to eq(238.75)
    end
  end
  describe '#exec 3' do
    it 'Calculate price with entry 17/04/2019 04:00' do
      timesheet = create(:timesheet_17_04_2019_04)
      price = CalculateSalaryService.new(timesheet).exec

      expect(price).to eq(451)
    end
  end
  describe '#exec 4' do
    it 'Calculate price with entry 20/04/2019' do
      timesheet = create(:timesheet_20_04_2019)
      price = CalculateSalaryService.new(timesheet).exec

      expect(price).to eq(211.5)
    end
  end
  describe '#exec 5' do
    it 'Calculate price with entry 17/04/2019 02:00' do
      timesheet = create(:timesheet_17_04_2019_02)
      price = CalculateSalaryService.new(timesheet).exec

      expect(price).to eq(136)
    end
  end
end
