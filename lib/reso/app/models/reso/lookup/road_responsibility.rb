class RESO::Lookup::RoadResponsibility < RESO::Enumeration
  has_many :road_responsibility_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :road_responsibility_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
