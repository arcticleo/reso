class RESO::Lookup::ListingService < RESO::Enumeration
  has_one :listing_service_assignment, foreign_key: :enumeration_id
  has_one :reso_property_listing, through: :listing_service_assignment, source: :enumerable, source_type: "RESO::Property::Listing"
end
