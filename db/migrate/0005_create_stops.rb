class CreateStops < ActiveRecord::Migration[7.0]
  def change
    create_table :stops do |t|
      t.string :code
      t.string :name
      t.string :stop
      t.string :lat
      t.string :lon
      t.string :url
      t.string :location_type
      t.integer :parent_station

      t.timestamps
    end
  end
end
