class RESO::Appliance < RESO::Enumeration
  has_many :reso_appliance_assignments, as: :child, class_name: "ApplianceAssignment"
  has_many :equipment,
    through: :reso_appliance_assignments,
    source: :parent,
    source_type: "RESO::Property::Equipment"
end
