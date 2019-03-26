class RESO::Lookup::AreaUnit < RESO::Enumeration
  has_many :area_unit_assignments, foreign_key: :enumeration_id
  has_many :reso_property_farming, through: :area_unit_assignments, source: :enumerable, source_type: "RESO::Property::Farming"
  has_many :reso_property_room, through: :area_unit_assignments, source: :enumerable, source_type: "RESO::PropertyRoom"
end
