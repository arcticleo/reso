class RESO::Lookup::Sewer < RESO::Enumeration
  has_many :sewer_assignments, foreign_key: :enumeration_id
  has_many :reso_property_utilities, through: :sewer_assignments, source: :enumerable, source_type: "RESO::Property::Utility"
end
