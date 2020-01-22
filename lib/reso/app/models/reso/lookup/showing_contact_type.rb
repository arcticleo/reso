class RESO::Lookup::ShowingContactType < RESO::Enumeration
  has_many :showing_contact_type_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_showings, through: :showing_contact_type_assignments, source: :enumerable, source_type: "RESO::Property::Listing::Showing"
end
