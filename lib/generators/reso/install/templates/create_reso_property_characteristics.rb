class CreateRESOPropertyCharacteristics < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_characteristics do |t|
      t.references :property, null: false, foreign_key: { to_table: :reso_properties }
      t.text :anchors_co_tenants
      t.string :frontage_length
      t.boolean :horse_yn
      t.integer :land_lease_amount
      t.date :land_lease_expiration_date
      t.boolean :land_lease_yn
      t.decimal :lot_size_acres, precision: 16, scale: 4
      t.decimal :lot_size_area, precision: 16, scale: 4
      t.string :lot_size_dimensions
      t.integer :lot_size_square_feet
      t.boolean :mobile_home_remains_yn
      t.integer :number_of_buildings
      t.integer :number_of_lots
      t.integer :number_of_pads
      t.integer :number_of_units_in_community
      t.integer :number_of_units_total
      t.string :park_manager_name
      t.string :park_manager_phone
      t.string :park_name
      t.boolean :pool_private_yn
      t.boolean :senior_community_yn
      t.boolean :spa_yn
      t.string :topography
      t.boolean :view_yn
      t.string :water_body_name
      t.boolean :waterfront_yn

      t.timestamps
    end
  end
end
