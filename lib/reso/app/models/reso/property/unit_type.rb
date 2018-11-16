class Reso::Property::UnitType < ApplicationRecord
  self.table_name = 'reso_property_unit_types'

  belongs_to :property

end
