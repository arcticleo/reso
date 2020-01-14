class RESO::Lookup::SpecialListingCondition < RESO::Enumeration
  has_many :special_listing_condition_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_contracts, through: :special_listing_condition_assignments, source: :enumerable, source_type: "RESO::Property::Listing::Contract"
end
