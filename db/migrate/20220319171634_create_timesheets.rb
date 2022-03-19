class CreateTimesheets < ActiveRecord::Migration[6.1]
  def change
    create_table :timesheets do |t|
      t.date :date_of_entry
      t.time :start_time
      t.time :finish_time

      t.timestamps
    end
  end
end
