class RESO::Lookup::Fencing < RESO::Enumeration
  has_many :fencing_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :fencing_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
