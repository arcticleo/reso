class RESO::Property::UnitType < ApplicationRecord
  self.table_name = 'reso_property_unit_types'

  belongs_to :property

  has_one :unit_type_type_assignment, as: :enumerable
  has_one :unit_type_type, through: :unit_type_type_assignment, source: :enumeration, class_name: "RESO::Lookup::UnitTypeType"

end
