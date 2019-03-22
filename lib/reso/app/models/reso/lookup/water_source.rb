class RESO::Lookup::WaterSource < RESO::Enumeration
  has_many :water_source_assignments, foreign_key: :enumeration_id
  has_many :reso_property_utilities, through: :water_source_assignments, source: :enumerable, source_type: "RESO::Property::Utility"
end
