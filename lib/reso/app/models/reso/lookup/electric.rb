class RESO::Lookup::Electric < RESO::Enumeration
  has_many :electric_assignments, foreign_key: :enumeration_id
  has_many :reso_property_utilities, through: :electric_assignments, source: :enumerable, source_type: "RESO::Property::Utility"
end
