class Reso::Property::Listing::Showing < ApplicationRecord
  self.table_name = 'reso_property_listing_showings'

  belongs_to :listing

end
