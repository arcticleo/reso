class RESO::OtherEquipment < RESO::Enumeration
  has_many :reso_other_equipment_assignments, as: :child, class_name: "OtherEquipmentAssignment"
  has_many :equipment,
    through: :reso_other_equipment_assignments,
    source: :parent,
    source_type: "RESO::Property::Equipment"
end
