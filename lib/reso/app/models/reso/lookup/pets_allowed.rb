class RESO::Lookup::PetsAllowed < RESO::Enumeration
  has_many :pets_allowed_assignments, foreign_key: :enumeration_id
  has_many :reso_property_hoa, through: :pets_allowed_assignments, source: :enumerable, source_type: "RESO::Property::HOA"
end
