class RESO::Lookup::OwnershipType < RESO::Enumeration
  has_one :ownership_type_assignment, foreign_key: :enumeration_id
  has_one :reso_property_businesses, through: :ownership_type_assignment, source: :enumerable, source_type: "RESO::Property::Business"
end
