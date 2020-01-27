class RESO::Lookup::Roof < RESO::Enumeration
  has_many :roof_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :roof_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
