class Reso::Property::Listing::Remark < ApplicationRecord
  self.table_name = 'reso_property_listing_remarks'

  belongs_to :listing

end
