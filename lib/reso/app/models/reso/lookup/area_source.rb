class RESO::Lookup::AreaSource < RESO::Enumeration
  has_many :area_source_assignments, foreign_key: :enumeration_id
  has_many :reso_property_farming, through: :area_source_assignments, source: :enumerable, source_type: "RESO::Property::Farming"
  has_many :reso_property_rooms, through: :area_source_assignments, source: :enumerable, source_type: "RESO::PropertyRoom"
  has_many :reso_property_structure, through: :area_source_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
