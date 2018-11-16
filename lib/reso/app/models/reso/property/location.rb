class Reso::Property::Location < ApplicationRecord
  self.table_name = 'reso_property_locations'
  
  has_one :school
end
