class RESO::Lookup::OtherStructure < RESO::Enumeration
  has_many :other_structure_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :other_structure_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
