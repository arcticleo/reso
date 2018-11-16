class Reso::Property::Location < ApplicationRecord
  self.table_name = 'reso_property_locations'
  
  has_one :address
  has_one :area
  has_one :gis, class_name: "GIS"
  has_one :school
end
