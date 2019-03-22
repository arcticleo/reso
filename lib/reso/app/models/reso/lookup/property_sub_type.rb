class RESO::Lookup::PropertySubType < RESO::Enumeration
  has_many :property_sub_type_assignments, foreign_key: :enumeration_id
  has_many :properties, through: :property_sub_type_assignments, source: :enumerable, source_type: "Property"
end
