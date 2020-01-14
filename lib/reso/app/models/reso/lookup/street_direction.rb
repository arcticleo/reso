class RESO::Lookup::StreetDirection < RESO::Enumeration
  has_many :street_direction_assignments, foreign_key: :enumeration_id
  has_many :reso_property_location_addresses, through: :street_direction_assignments, source: :enumerable, source_type: "RESO::Property::Location::Address"
end
