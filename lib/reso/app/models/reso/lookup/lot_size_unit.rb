class RESO::Lookup::LotSizeUnit < RESO::Enumeration
  has_one :lot_size_unit_assignment, foreign_key: :enumeration_id
  has_one :reso_property_characteristic, through: :lot_size_unit_assignment, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
