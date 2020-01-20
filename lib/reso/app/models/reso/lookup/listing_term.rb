class RESO::Lookup::ListingTerm < RESO::Enumeration
  has_many :listing_term_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_contracts, through: :listing_term_assignments, source: :enumerable, source_type: "RESO::Property::Listing::Contract"
end
