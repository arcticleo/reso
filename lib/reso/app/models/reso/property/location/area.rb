class Reso::Property::Location::Area < ApplicationRecord
  self.table_name = 'reso_property_location_areas'

  belongs_to :location

end
