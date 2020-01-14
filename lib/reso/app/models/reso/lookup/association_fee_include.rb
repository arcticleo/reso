class RESO::Lookup::AssociationFeeInclude < RESO::Enumeration
  has_many :association_fee_include_assignments, foreign_key: :enumeration_id
  has_many :reso_property_hoa, through: :association_fee_include_assignments, source: :enumerable, source_type: "RESO::Property::HOA"
end

