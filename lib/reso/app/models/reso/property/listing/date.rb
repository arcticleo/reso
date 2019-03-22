class RESO::Property::Listing::Date < ApplicationRecord
  self.table_name = 'reso_property_listing_dates'

  belongs_to :listing

end
