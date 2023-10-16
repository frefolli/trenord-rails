class CreateCalendars < ActiveRecord::Migration[7.0]
  def change
    create_table :calendars, id: false do |t|
      t.string :id
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :calendars, [:id], unique: true
  end
end
