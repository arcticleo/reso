class RESO::Lookup::TaxStatusCurrent < RESO::Enumeration
  has_many :tax_status_current_assignments, foreign_key: :enumeration_id
  has_many :reso_property_taxes, through: :tax_status_current_assignments, source: :enumerable, source_type: "RESO::Property::Tax"
end
