class RESO::Lookup::SyndicateTo < RESO::Enumeration
  has_many :syndicate_to_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_marketings, through: :syndicate_to_assignments, source: :enumerable, source_type: "RESO::Property::Listing::Marketing"
end
