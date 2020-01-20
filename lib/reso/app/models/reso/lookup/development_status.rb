class RESO::Lookup::DevelopmentStatus < RESO::Enumeration
  has_many :development_status_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :development_status_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
