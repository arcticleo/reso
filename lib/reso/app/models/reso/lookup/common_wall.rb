class RESO::Lookup::CommonWall < RESO::Enumeration
  has_many :common_wall_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :common_wall_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
