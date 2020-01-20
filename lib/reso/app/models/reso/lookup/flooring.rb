class RESO::Lookup::Flooring < RESO::Enumeration
  has_many :flooring_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :flooring_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
