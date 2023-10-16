class CreateCalendarDates < ActiveRecord::Migration[7.0]
  def change
    create_table :calendar_dates, id: false do |t|
      t.date :date
      t.references :calendar, null: false, foreign_key: true, type: :string
      t.string :exception_type

      t.timestamps
    end
  end
end
