class RESO::Lookup::OwnershipType < RESO::Enumeration
  has_many :ownership_type_assignments, foreign_key: :enumeration_id
  has_many :reso_property_businesses, through: :ownership_type_assignments, source: :enumerable, source_type: "RESO::Property::Business"
end
