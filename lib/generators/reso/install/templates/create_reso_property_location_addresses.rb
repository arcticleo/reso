class CreateRESOPropertyLocationAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_location_addresses do |t|
      t.references :location, null: false, foreign_key: { to_table: :reso_property_locations }
      t.string :carrier_route, limit: 9
      t.string :postal_code, limit: 10
      t.string :postal_code_plus4, limit: 4
      t.string :street_additional_info, limit: 50
      t.string :street_name, limit: 50
      t.string :street_number, limit: 25
      t.string :street_number_numeric, limit: 10
      t.string :street_suffix_modifier, limit: 25
      t.string :township, limit: 50
      t.string :unit_number
      t.string :unparsed_address

      t.timestamps
    end
    add_index :reso_property_location_addresses, :carrier_route
    add_index :reso_property_location_addresses, :postal_code
    add_index :reso_property_location_addresses, :postal_code_plus4
    add_index :reso_property_location_addresses, :street_additional_info
    add_index :reso_property_location_addresses, :street_name
    add_index :reso_property_location_addresses, :street_number
    add_index :reso_property_location_addresses, :street_number_numeric
    add_index :reso_property_location_addresses, :street_suffix_modifier
    add_index :reso_property_location_addresses, :township
    add_index :reso_property_location_addresses, :unit_number
    add_index :reso_property_location_addresses, :unparsed_address
  end
end
