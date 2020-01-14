class RESO::Lookup::WindowFeature < RESO::Enumeration
  has_many :window_feature_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :window_feature_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
