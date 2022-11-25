class CreateRESOPropertyLocationAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_location_areas do |t|
      t.references :location, null: false, foreign_key: { to_table: :reso_property_locations }
      t.string :city_region, limit: 150
      t.string :continent_region, limit: 150
      t.string :country_region, limit: 150
      t.string :state_region, limit: 150
      t.string :subdivision_name

      t.timestamps
    end
  end
end
