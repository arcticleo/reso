class RESO::Lookup::Basement < RESO::Enumeration
  has_many :basement_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :basement_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end

