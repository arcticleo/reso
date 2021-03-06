class RESO::Lookup::TenantPay < RESO::Enumeration
  has_many :tenant_pay_assignments, foreign_key: :enumeration_id
  has_many :reso_property_financials, through: :tenant_pay_assignments, source: :enumerable, source_type: "RESO::Property::TenantPay"
end
