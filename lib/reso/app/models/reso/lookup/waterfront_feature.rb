class RESO::Lookup::WaterfrontFeature < RESO::Enumeration
  has_many :waterfront_feature_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :waterfront_feature_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
