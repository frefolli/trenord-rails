class CreateAgencies < ActiveRecord::Migration[7.0]
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :url
      t.string :timezone
      t.string :lang
      t.string :phone

      t.timestamps
    end
  end
end
