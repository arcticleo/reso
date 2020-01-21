class RESO::Lookup::OwnerPay < RESO::Enumeration
  has_many :owner_pay_assignments, foreign_key: :enumeration_id
  has_many :reso_property_financials, through: :owner_pay_assignments, source: :enumerable, source_type: "RESO::Property::Financial"
end
