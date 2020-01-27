class RESO::Lookup::PropertyType < RESO::Enumeration
  has_one :property_type_assignment, foreign_key: :enumeration_id
  has_one :reso_property, through: :property_type_assignment, source: :enumerable, source_type: "RESO::Property"
end
