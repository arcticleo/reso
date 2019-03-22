class RESO::Lookup::UnitsFurnished < RESO::Enumeration
  has_many :units_furnished_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :units_furnished_assignments, source: :enumerable, source_type: "RESO::Property::Characteristics"
end
