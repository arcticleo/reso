class Reso::Property::Structure < ApplicationRecord
  self.table_name = 'reso_property_structures'

  has_one :performance
  has_one :room
end
