class RESO::Lookup::ContactStatus < RESO::Enumeration
  has_one :contact_status_assignment, foreign_key: :enumeration_id
  has_one :reso_contact, through: :contact_status_assignment, source: :enumerable, source_type: "RESO::Contact"
end
