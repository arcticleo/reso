class RESO::Lookup::ParkingFeature < RESO::Enumeration
  has_many :parking_feature_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :parking_feature_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
