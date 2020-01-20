class RESO::Lookup::ListingAgreement < RESO::Enumeration
  has_one :listing_agreement_assignment, foreign_key: :enumeration_id
  has_one :reso_property_listing, through: :listing_agreement_assignment, source: :enumerable, source_type: "RESO::Property::Listing"
end
