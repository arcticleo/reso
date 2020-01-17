class RESO::Lookup::ContactListingPreference < RESO::Enumeration
  has_many :contact_listing_preference_assignments, foreign_key: :enumeration_id
  has_many :reso_contact_listings, through: :contact_listing_preference_assignments, source: :enumerable, source_type: "RESO::ContactListing"
end
