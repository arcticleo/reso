class RESO::Lookup::Cooling < RESO::Enumeration
  has_many :cooling_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :cooling_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
