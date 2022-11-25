class RESO::SecurityFeature < RESO::Enumeration
  has_many :reso_security_feature_assignments, as: :child, class_name: "SecurityFeatureAssignment"
  has_many :equipment,
    through: :reso_security_feature_assignments,
    source: :parent,
    source_type: "RESO::Property::Equipment"
end
