class RESO::Lookup::OperatingExpenseInclude < RESO::Enumeration
  has_many :operating_expense_include_assignments, foreign_key: :enumeration_id
  has_many :reso_property_financials, through: :operating_expense_include_assignments, source: :enumerable, source_type: "RESO::Property::Financial"
end
