class RESO::Lookup::Concession < RESO::Enumeration
  has_many :concession_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_closings, through: :concession_assignments, source: :enumerable, source_type: "RESO::Property::Listing::Closing"
end
