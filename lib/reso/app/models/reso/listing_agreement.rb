class RESO::ListingAgreement < RESO::Enumeration
  has_many :reso_listing_agreement_assignments, as: :child, class_name: "ListingAgreementAssignment"
  has_many :listings,
    through: :reso_listing_agreement_assignments,
    source: :parent,
    source_type: "RESO::Property::Listing"
end
