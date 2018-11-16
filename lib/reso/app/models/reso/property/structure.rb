class Reso::Property::Structure < ApplicationRecord
  self.table_name = 'reso_property_structures'

  belongs_to :property

  has_one :performance
  has_one :room
end
