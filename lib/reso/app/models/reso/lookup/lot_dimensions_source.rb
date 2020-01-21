class RESO::Lookup::LotDimensionsSource < RESO::Enumeration
  has_one :lot_dimensions_source_assignment, foreign_key: :enumeration_id
  has_one :reso_property_characteristic, through: :lot_dimensions_source_assignment, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
