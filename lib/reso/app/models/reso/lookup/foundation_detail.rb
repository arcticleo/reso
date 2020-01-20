class RESO::Lookup::FoundationDetail < RESO::Enumeration
  has_many :foundation_detail_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :foundation_detail_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
