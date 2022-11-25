class CreateRESOPropertyLocationGIS < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_location_gis do |t|
      t.references :location, null: false, foreign_key: { to_table: :reso_property_locations }
      t.string :cross_street
      t.text :directions
      t.decimal :elevation, precision: 10, scale: 2
      t.decimal :latitude, precision: 16, scale: 6
      t.decimal :longitude, precision: 16, scale: 6
      t.string :map_coordinate
      t.string :map_coordinate_source
      t.text :map_url

      t.timestamps
    end
  end
end
