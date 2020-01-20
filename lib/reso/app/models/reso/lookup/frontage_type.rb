class RESO::Lookup::FrontageType < RESO::Enumeration
  has_many :frontage_type_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :frontage_type_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
