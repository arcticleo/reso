class RESO::Lookup::Furnished < RESO::Enumeration
  has_one :furnished_assignment, foreign_key: :enumeration_id
  has_one :reso_property_characteristic, through: :furnished_assignment, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
