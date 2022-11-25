class CreateRESOPropertyListingPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_listing_prices do |t|
      t.references :listing, null: false, foreign_key: { to_table: :reso_property_listings }
      t.bigint :close_price
      t.bigint :list_price
      t.bigint :list_price_low
      t.bigint :original_list_price
      t.bigint :previous_list_price

      t.timestamps
    end
    add_index :reso_property_listing_prices, :close_price
    add_index :reso_property_listing_prices, :list_price
    add_index :reso_property_listing_prices, :list_price_low
    add_index :reso_property_listing_prices, :original_list_price
    add_index :reso_property_listing_prices, :previous_list_price
  end
end
