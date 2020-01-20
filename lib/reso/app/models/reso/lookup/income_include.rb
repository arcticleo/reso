class RESO::Lookup::IncomeInclude < RESO::Enumeration
  has_many :income_include_assignments, foreign_key: :enumeration_id
  has_many :reso_property_financials, through: :income_include_assignments, source: :enumerable, source_type: "RESO::Property::Financial"
end
