class SyncEntryWorkingPriceJob < ApplicationJob
  queue_as :default

  def perform(entry)
    return if entry.blank?

    price = CalculateSalaryService.new(entry).exec
    entry.update_columns(total_price: price)
  end
end
