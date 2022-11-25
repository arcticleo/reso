class RESO::ListingService < RESO::Enumeration
  has_many :reso_listing_service_assignments, as: :child, class_name: "ListingServiceAssignment"
  has_many :listings,
    through: :reso_listing_service_assignments,
    source: :parent,
    source_type: "RESO::Property::Listing"
end
