class RESO::Lookup::DoorFeature < RESO::Enumeration
  has_many :door_feature_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :door_feature_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
