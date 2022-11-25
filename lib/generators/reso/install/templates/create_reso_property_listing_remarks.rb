class CreateRESOPropertyListingRemarks < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_listing_remarks do |t|
      t.references :listing, null: false, foreign_key: { to_table: :reso_property_listings }
      t.text :private_office_remarks
      t.text :private_remarks
      t.text :public_remarks
      t.text :syndication_remarks

      t.timestamps
    end
  end
end
