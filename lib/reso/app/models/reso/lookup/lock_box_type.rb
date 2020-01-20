class RESO::Lookup::LockBoxType < RESO::Enumeration
  has_many :lock_box_type_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_showings, through: :lock_box_type_assignments, source: :enumerable, source_type: "RESO::Property::Listing::Showing"
end
