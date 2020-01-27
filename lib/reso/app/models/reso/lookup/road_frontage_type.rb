class RESO::Lookup::RoadFrontageType < RESO::Enumeration
  has_many :road_frontage_type_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :road_frontage_type_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
