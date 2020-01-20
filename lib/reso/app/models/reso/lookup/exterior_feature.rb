class RESO::Lookup::ExteriorFeature < RESO::Enumeration
  has_many :exterior_feature_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :exterior_feature_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
