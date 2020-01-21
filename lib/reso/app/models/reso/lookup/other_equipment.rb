class RESO::Lookup::OtherEquipment < RESO::Enumeration
  has_many :other_equipment_assignments, foreign_key: :enumeration_id
  has_many :reso_property_equipment, through: :other_equipment_assignments, source: :enumerable, source_type: "RESO::Property::Equipment"
end
