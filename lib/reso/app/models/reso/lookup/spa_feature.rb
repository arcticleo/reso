class RESO::Lookup::SpaFeature < RESO::Enumeration
  has_many :spa_feature_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :spa_feature_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
