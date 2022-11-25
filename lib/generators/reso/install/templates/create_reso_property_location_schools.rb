class CreateRESOPropertyLocationSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_location_schools do |t|
      t.references :location, null: false, foreign_key: { to_table: :reso_property_locations }

      t.timestamps
    end
  end
end
