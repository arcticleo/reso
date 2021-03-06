class RESO::Property::Utility < ApplicationRecord
  self.table_name = 'reso_property_utilities'

  belongs_to :property

  has_many :utility_assignments, as: :enumerable
  has_many :utilities, through: :utility_assignments, source: :enumeration, class_name: "RESO::Lookup::Utility"

  has_many :water_source_assignments, as: :enumerable
  has_many :water_source, through: :water_source_assignments, source: :enumeration, class_name: "RESO::Lookup::WaterSource"

end
