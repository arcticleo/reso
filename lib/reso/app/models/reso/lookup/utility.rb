class RESO::Lookup::Utility < RESO::Enumeration
  has_many :utility_assignments, foreign_key: :enumeration_id
  has_many :reso_property_utilities, through: :utility_assignments, source: :enumerable, source_type: "RESO::Property::Utility"
end
