class RESO::Lookup::PossibleUse < RESO::Enumeration
  has_many :possible_use_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :possible_use_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
