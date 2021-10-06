class RESO::Lookup::CurrentUse < RESO::Enumeration
  has_many :current_use_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :current_use_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
