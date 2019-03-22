class RESO::Property::Listing::Marketing < ApplicationRecord
  self.table_name = 'reso_property_listing_marketings'

  belongs_to :listing

end
