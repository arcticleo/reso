class RESO::Lookup::BusinessType < RESO::Enumeration
  has_many :business_type_assignments, foreign_key: :enumeration_id
  has_many :reso_property_businesses, through: :business_type_assignments, source: :enumerable, source_type: "RESO::Property::Business"
end
