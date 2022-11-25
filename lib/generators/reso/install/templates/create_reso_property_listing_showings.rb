class CreateRESOPropertyListingShowings < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_listing_showings do |t|
      t.references :listing, null: false, foreign_key: { to_table: :reso_property_listings }

      t.string :access_code, limit: 25
      t.string :lock_box_location
      t.string :lock_box_serial_number, limit: 25
      t.integer :showing_advance_notice
      t.boolean :showing_attended_yn
      t.string :showing_contact_name, limit: 40
      t.string :showing_contact_phone_ext, limit: 10
      t.string :showing_contact_phone, limit: 16
      t.datetime :showing_end_time
      t.text :showing_instructions
      t.datetime :showing_start_time

      t.timestamps
    end
  end
end
