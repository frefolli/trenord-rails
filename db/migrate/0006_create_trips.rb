class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.references :route, null: false, foreign_key: true
      t.references :calendar, null: false, foreign_key: true, type: :string
      t.string :trip_headsign
      t.string :trip_short_name
      t.integer :direction_id
      t.integer :block_id
      t.integer :shape_id

      t.timestamps
    end
  end
end
