class RESO::Lookup::ContactType < RESO::Enumeration
  has_many :contact_type_assignments, foreign_key: :enumeration_id
  has_many :reso_contact, through: :contact_type_assignments, source: :enumerable, source_type: "RESO::Contact"
end
