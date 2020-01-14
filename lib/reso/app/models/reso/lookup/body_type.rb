class RESO::Lookup::BodyType < RESO::Enumeration
  has_many :body_type_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :body_type_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
