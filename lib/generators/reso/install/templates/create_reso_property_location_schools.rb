class CreateRESOPropertyLocationSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_location_schools do |t|
      t.references :location, null: false, foreign_key: { to_table: :reso_property_locations }
      t.string :elementary_school_district, limit: 50
      t.string :elementary_school, limit: 50
      t.string :high_school_district, limit: 50
      t.string :high_school, limit: 50
      t.string :middle_or_junior_school_district, limit: 50
      t.string :middle_or_junior_school, limit: 50

      t.timestamps
    end
  end
end
