class CreateStopTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :stop_times, id: false do |t|
      t.references :trip, null: false, foreign_key: true
      t.time :arrival
      t.time :departure
      t.references :stop, null: false, foreign_key: true
      t.string :stop_sequence
      t.string :stop_headsign
      t.string :pickup_type
      t.string :drop_off_type
      t.string :shape_dist_traveled

      t.timestamps
    end
  end
end
