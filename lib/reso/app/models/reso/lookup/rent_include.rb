class RESO::Lookup::RentInclude < RESO::Enumeration
  has_many :rent_include_assignments, foreign_key: :enumeration_id
  has_many :reso_property_financials, through: :rent_include_assignments, source: :enumerable, source_type: "RESO::Property::Financial"
end
