class RESO::Lookup::HoursDaysOfOperation < RESO::Enumeration
  has_many :hours_days_of_operation_assignments, foreign_key: :enumeration_id
  has_many :reso_property_businesses, through: :hours_days_of_operation_assignments, source: :enumerable, source_type: "RESO::Property::Business"
end
