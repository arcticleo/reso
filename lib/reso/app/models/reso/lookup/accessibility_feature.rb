class RESO::Lookup::AccessibilityFeature < RESO::Enumeration
  has_many :accessibility_feature_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :accessibility_feature_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
