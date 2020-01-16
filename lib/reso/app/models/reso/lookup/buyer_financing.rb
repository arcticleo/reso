class RESO::Lookup::BuyerFinancing < RESO::Enumeration
  has_many :buyer_financing_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_closings, through: :buyer_financing_assignments, source: :enumerable, source_type: "RESO::Property::Listing::Closing"
end
