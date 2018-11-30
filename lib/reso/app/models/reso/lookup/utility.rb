class Reso::Lookup::Utility < Reso::Enumeration
  has_many :utility_assignments, foreign_key: :enumeration_id
  has_many :reso_property_utilities, through: :utility_assignments, source: :enumerable, source_type: "Reso::Property::Utility"
end
