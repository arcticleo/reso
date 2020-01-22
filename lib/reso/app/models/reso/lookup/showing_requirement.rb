class RESO::Lookup::ShowingRequirement < RESO::Enumeration
  has_many :showing_requirement_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_showings, through: :showing_requirement_assignments, source: :enumerable, source_type: "RESO::Property::Listing::Showing"
end
