class RESO::Lookup::Possession < RESO::Enumeration
  has_many :possession_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_closings, through: :possession_assignments, source: :enumerable, source_type: "RESO::Property::Listing::Closing"
end
