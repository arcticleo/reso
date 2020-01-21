class RESO::Lookup::OccupantType < RESO::Enumeration
  has_one :occupant_type_assignment, foreign_key: :enumeration_id
  has_one :reso_property_occupant_owner, through: :occupant_type_assignment, source: :enumerable, source_type: "RESO::Property::OccupantOwner"
end
