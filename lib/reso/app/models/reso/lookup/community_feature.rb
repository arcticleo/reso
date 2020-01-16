class RESO::Lookup::CommunityFeature < RESO::Enumeration
  has_many :community_feature_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :community_feature_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
