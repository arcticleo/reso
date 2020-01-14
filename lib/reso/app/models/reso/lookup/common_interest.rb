class RESO::Lookup::CommonInterest < RESO::Enumeration
  has_many :common_interest_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_contracts, through: :common_interest_assignments, source: :enumerable, source_type: "RESO::Property::Listing::Contract"
end
