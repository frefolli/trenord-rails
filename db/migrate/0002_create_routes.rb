class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.references :agency, null: false, foreign_key: true
      t.string :short_name
      t.string :long_name
      t.string :desc
      t.string :route_type
      t.string :url
      t.string :color
      t.string :text_color

      t.timestamps
    end
  end
end
