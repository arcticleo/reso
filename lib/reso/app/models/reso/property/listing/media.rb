class RESO::Property::Listing::Media < ApplicationRecord
  self.table_name = 'reso_property_listing_media'

  belongs_to :listing

end
