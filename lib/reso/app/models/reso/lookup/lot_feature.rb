class RESO::Lookup::LotFeature < RESO::Enumeration
  has_many :lot_feature_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :lot_feature_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
