class RESO::Lookup::LaborInformation < RESO::Enumeration
  has_many :labor_information_assignments, foreign_key: :enumeration_id
  has_many :reso_property_businesses, through: :labor_information_assignments, source: :enumerable, source_type: "RESO::Property::Business"
end
