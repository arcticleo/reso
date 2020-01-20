class RESO::Lookup::DirectionFace < RESO::Enumeration
  has_many :direction_face_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :direction_face_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
