class CreateRESOPropertyListings < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_listings do |t|
      t.references :property, null: false, foreign_key: { to_table: :reso_properties }
      t.text :copyright_notice
      t.text :disclaimer
      t.boolean :home_warranty_yn
      t.boolean :lease_considered_yn
      t.string :listing_id
      t.string :listing_key
      t.string :listing_key_numeric
      t.string :originating_system_id, limit: 25
      t.string :originating_system_key
      t.string :originating_system_name
      t.string :source_system_id, limit: 25
      t.string :source_system_key
      t.string :source_system_name

      t.timestamps
    end
    add_index :reso_property_listings, :home_warranty_yn
    add_index :reso_property_listings, :lease_considered_yn
    add_index :reso_property_listings, :listing_id
    add_index :reso_property_listings, :listing_key
    add_index :reso_property_listings, :listing_key_numeric
    add_index :reso_property_listings, :originating_system_id
    add_index :reso_property_listings, :originating_system_key
    add_index :reso_property_listings, :originating_system_name
    add_index :reso_property_listings, :source_system_id
    add_index :reso_property_listings, :source_system_key
    add_index :reso_property_listings, :source_system_name
  end
end
