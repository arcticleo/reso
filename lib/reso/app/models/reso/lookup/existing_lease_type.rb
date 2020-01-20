class RESO::Lookup::ExistingLeaseType < RESO::Enumeration
  has_many :existing_lease_type_assignments, foreign_key: :enumeration_id
  has_many :reso_property_financials, through: :existing_lease_type_assignments, source: :enumerable, source_type: "RESO::Property::Financial"
end
