class RESO::Lookup::PatioAndPorchFeature < RESO::Enumeration
  has_many :patio_and_porch_feature_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :patio_and_porch_feature_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
