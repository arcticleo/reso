class RESO::Lookup::HorseAmenity < RESO::Enumeration
  has_many :horse_amenity_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :horse_amenity_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
