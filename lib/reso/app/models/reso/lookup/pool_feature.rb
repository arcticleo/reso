class RESO::Lookup::PoolFeature < RESO::Enumeration
  has_many :pool_feature_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :pool_feature_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
