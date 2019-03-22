class RESO::Property::Financial < ApplicationRecord
  self.table_name = 'reso_property_financials'

  belongs_to :property

  has_many :tenant_pay_assignments, as: :enumerable
  has_many :tenant_pays, through: :tenant_pay_assignments, source: :enumeration, class_name: "RESO::Lookup::TenantPay"

end
