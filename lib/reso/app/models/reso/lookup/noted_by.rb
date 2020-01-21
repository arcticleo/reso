class RESO::Lookup::NotedBy < RESO::Enumeration
  has_one :noted_by_assignment, foreign_key: :enumeration_id
  has_one :reso_contact_listing_note, through: :noted_by_assignment, source: :enumerable, source_type: "RESO::ContactListingNote"
end
