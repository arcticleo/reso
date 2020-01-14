class RESO::Lookup::StructureType < RESO::Enumeration
  has_many :strucuture_type_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :structure_type_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
