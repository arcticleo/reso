class RESO::Lookup::FinancialDataSource < RESO::Enumeration
  has_many :financial_data_source_assignments, foreign_key: :enumeration_id
  has_many :reso_property_financials, through: :financial_data_source_assignments, source: :enumerable, source_type: "RESO::Property::Financial"
end
