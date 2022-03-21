class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :prices do |t|
      t.integer :date_of_week
      t.string :start_time
      t.string :end_time
      t.float :price_inside_time
      t.float :price_outside_time

      t.timestamps
    end
  end
end
