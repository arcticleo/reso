class RESO::Lookup::CompensationType < RESO::Enumeration
  has_one :buyer_agency_compensation_type_assignment, foreign_key: :enumeration_id
  has_one :sub_agency_compensation_type_assignment, foreign_key: :enumeration_id
  has_one :transaction_broker_compensation_type_assignment, foreign_key: :enumeration_id
  has_one :reso_property_listing_compensation, through: :buyer_agency_compensation_type_assignment, source: :enumerable, source_type: "RESO::Property::Listing::Compensation"
  has_one :reso_property_listing_compensation, through: :sub_agency_compensation_type_assignment, source: :enumerable, source_type: "RESO::Property::Listing::Compensation"
  has_one :reso_property_listing_compensation, through: :transaction_broker_compensation_type_assignment, source: :enumerable, source_type: "RESO::Property::Listing::Compensation"
end
