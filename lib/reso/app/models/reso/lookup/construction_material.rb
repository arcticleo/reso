class RESO::Lookup::ConstructionMaterial < RESO::Enumeration
  has_many :construction_material_assignments, foreign_key: :enumeration_id
  has_many :reso_property_scuctures, through: :construction_material_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
