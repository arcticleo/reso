class RESO::Lookup::RoadSurfaceType < RESO::Enumeration
  has_many :road_surface_type_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :road_surface_type_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
