class RESO::Lookup::LeaseRenewalCompensation < RESO::Enumeration
  has_many :lease_renewal_compensation_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_compensations, through: :lease_renewal_compensation_assignments, source: :enumerable, source_type: "RESO::Property::Listing::Compensation"
end
