class RESO::Lookup::Skirt < RESO::Enumeration
  has_many :skirt_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :skirt_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
