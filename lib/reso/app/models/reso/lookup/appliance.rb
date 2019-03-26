class RESO::Lookup::Appliance < RESO::Enumeration
  has_many :appliance_assignments, foreign_key: :enumeration_id
  has_many :reso_property_equipment, through: :appliance_assignments, source: :enumerable, source_type: "RESO::Property::Equipment"
end
