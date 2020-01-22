class RESO::Lookup::SecurityFeature < RESO::Enumeration
  has_many :security_feature_assignments, foreign_key: :enumeration_id
  has_many :reso_property_equipment, through: :security_feature_assignments, source: :enumerable, source_type: "RESO::Property::Equipment"
end
