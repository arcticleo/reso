class RESO::Lookup::UnitTypeType < RESO::Enumeration
  has_many :unit_type_type_assignments, foreign_key: :enumeration_id
  has_many :reso_property_unit_types, through: :unit_type_type_assignments, source: :enumerable, source_type: "RESO::Property::UnitTypeType"
end
