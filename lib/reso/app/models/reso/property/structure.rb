class RESO::Property::Structure < ApplicationRecord
  self.table_name = 'reso_property_structures'

  belongs_to :property

  has_one :year_built_source_assignment, as: :enumerable
  has_one :year_built_source, through: :year_built_source_assignment, source: :enumeration, class_name: "RESO::Lookup::YearBuiltSource"

  has_one :performance
  has_one :room
end
