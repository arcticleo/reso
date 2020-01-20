class RESO::Lookup::LeaseTerm < RESO::Enumeration
  has_one :lease_term_assignment, foreign_key: :enumeration_id
  has_one :reso_property_characteristic, through: :lease_term_assignment, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
