class RESO::Lookup::SpecialLicense < RESO::Enumeration
  has_many :special_license_assignments, foreign_key: :enumeration_id
  has_many :reso_property_businesses, through: :special_license_assignments, source: :enumerable, source_type: "RESO::Property::Business"
end
