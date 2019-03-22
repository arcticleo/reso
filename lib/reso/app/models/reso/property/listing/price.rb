class RESO::Property::Listing::Price < ApplicationRecord
  self.table_name = 'reso_property_listing_prices'

  belongs_to :listing

end
