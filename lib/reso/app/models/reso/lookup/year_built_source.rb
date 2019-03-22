class RESO::Lookup::YearBuiltSource < RESO::Enumeration
  has_many :year_built_source_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :year_built_source_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
