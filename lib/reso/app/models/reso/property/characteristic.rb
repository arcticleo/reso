class RESO::Property::Characteristic < ApplicationRecord
  self.table_name = 'reso_property_characteristics'

  belongs_to :property

  has_one :units_furnished_assignment, as: :enumerable
  has_one :units_furnished, through: :units_furnished_assignment, source: :enumeration, class_name: "RESO::Lookup::UnitsFurnished"

end
