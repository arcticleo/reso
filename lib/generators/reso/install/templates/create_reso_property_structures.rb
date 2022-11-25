class CreateRESOPropertyStructures < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_structures do |t|
      t.references :property, null: false, foreign_key: { to_table: :reso_properties }

      t.decimal :above_grade_finished_area, precision: 14, scale:4
      t.boolean :attached_garage_yn
      t.boolean :basement_yn
      t.integer :bathrooms_full
      t.integer :bathrooms_half
      t.integer :bathrooms_one_quarter
      t.integer :bathrooms_partial
      t.integer :bathrooms_three_quarter
      t.integer :bathrooms_total_integer
      t.integer :bedrooms_possible
      t.integer :bedrooms_total
      t.decimal :below_grade_finished_area, precision: 14, scale:4
      t.string :builder_model, limit: 50
      t.string :builder_name, limit: 50
      t.decimal :building_area_total, precision: 14, scale: 4
      t.string :building_name, limit: 50
      t.integer :carport_spaces
      t.boolean :carport_yn
      t.boolean :cooling_yn
      t.integer :covered_spaces
      t.string :doh_1, limit: 25
      t.string :doh_2, limit: 25
      t.string :doh_3, limit: 25
      t.integer :entry_level
      t.string :entry_location, limit: 50
      t.integer :fireplaces_total
      t.boolean :fireplace_yn
      t.decimal :foundation_area, precision: 14, scale: 2
      t.integer :garage_spaces
      t.boolean :garage_yn
      t.boolean :habitable_residence_yn
      t.boolean :heating_yn
      t.decimal :leasable_area, precision: 14, scale: 2
      t.string :license_1, limit: 25
      t.string :license_2, limit: 25
      t.string :license_3, limit: 25
      t.decimal :living_area, precision: 14, scale: 2
      t.integer :main_level_bathrooms
      t.integer :main_level_bedrooms
      t.string :make, limit: 50
      t.decimal :mobile_length, precision: 14, scale: 2
      t.decimal :mobile_width, precision: 14, scale: 2
      t.string :model, limit: 50
      t.boolean :new_construction_yn
      t.decimal :open_parking_spaces, precision: 14, scale: 2
      t.boolean :open_parking_yn
      t.text :other_parking
      t.decimal :parking_total, precision: 14, scale: 2
      t.boolean :property_attached_yn
      t.string :rv_parking_dimensions, limit: 50
      t.string :serial_u, limit: 25
      t.string :serial_x, limit: 25
      t.string :serial_xx, limit: 25
      t.integer :stories
      t.integer :stories_total
      t.text :year_built_details
      t.integer :year_built_effective
      t.integer :year_built

      t.timestamps
    end
  end
end


