class RESO::Lookup::StandardStatus < RESO::Enumeration
  has_many :standard_status_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listings, through: :standard_status_assignments, source: :enumerable, source_type: "RESO::Property::Listing"
end
