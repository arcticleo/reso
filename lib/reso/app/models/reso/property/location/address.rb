class RESO::Property::Location::Address < ApplicationRecord
  self.table_name = 'reso_property_location_addresses'

  belongs_to :location

end
