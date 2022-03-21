require 'rails_helper'

RSpec.describe SyncEntryWorkingPriceJob do
  before(:all) do
    create(:price_mon)
    create(:price_tue)
    create(:price_wed)
    create(:price_thur)
    create(:price_fri)
    create(:price_sat)
    create(:price_sun)
  end
  describe '#perform_later' do
    let(:timesheet) { create(:timesheet_19_03_2022) }
    it 'exec' do
      ActiveJob::Base.queue_adapter = :test
      expect {
        SyncEntryWorkingPriceJob.perform_later(timesheet)
      }.to have_enqueued_job
    end
  end
end
