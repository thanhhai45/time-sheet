class CreateWorkingPrices < ActiveRecord::Migration[6.1]
  def change
    create_table :working_prices do |t|
      t.int :date_of_week
      t.time :start_time
      t.time :end_time
      t.decimal :price

      t.timestamps
    end
  end
end
