class Reso::Lookup::Vegetation < Reso::Enumeration
  has_many :vegetation_assignments, foreign_key: :enumeration_id
  has_many :reso_property_farmings, through: :vegetation_assignments, source: :enumerable, source_type: "Reso::Property::Farming"
end
