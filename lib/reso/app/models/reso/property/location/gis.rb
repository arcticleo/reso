class Reso::Property::Location::GIS < ApplicationRecord
  self.table_name = 'reso_property_location_gis'

  belongs_to :location

end
