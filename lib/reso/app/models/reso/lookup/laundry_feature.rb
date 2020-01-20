class RESO::Lookup::LaundryFeature < RESO::Enumeration
  has_many :laundry_feature_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :laundry_feature_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
