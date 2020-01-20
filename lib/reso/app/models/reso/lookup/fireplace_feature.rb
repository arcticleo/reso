class RESO::Lookup::FireplaceFeature < RESO::Enumeration
  has_many :fireplace_feature_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :fireplace_feature_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
