class RESO::Property::Listing::Closing < ApplicationRecord
  self.table_name = 'reso_property_listing_closings'

  belongs_to :listing

end
