class RESO::Lookup::CurrentFinancing < RESO::Enumeration
  has_many :current_financing_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_contracts, through: :current_financing_assignments, source: :enumerable, source_type: "RESO::Property::Listing::Contract"
end
