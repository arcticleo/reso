class Reso::Property::Listing::Contract < ApplicationRecord
  self.table_name = 'reso_property_listing_contracts'

  belongs_to :listing

end
