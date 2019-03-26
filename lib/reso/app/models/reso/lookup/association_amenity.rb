class RESO::Lookup::AssociationAmenity < RESO::Enumeration
  has_many :association_amenity_assignments, foreign_key: :enumeration_id
  has_many :reso_property_hoa, through: :association_amenity_assignments, source: :enumerable, source_type: "RESO::Property::HOA"
end
