class RESO::Lookup::View < RESO::Enumeration
  has_many :view_assignments, foreign_key: :enumeration_id
  has_many :reso_property_characteristics, through: :view_assignments, source: :enumerable, source_type: "RESO::Property::Characteristic"
end
