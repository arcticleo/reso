class RESO::Lookup::Heating < RESO::Enumeration
  has_many :heating_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :heating_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
