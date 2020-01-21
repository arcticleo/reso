class RESO::Lookup::MemberType < RESO::Enumeration
  has_one :member_type_assignment, foreign_key: :enumeration_id
  has_one :reso_members, through: :member_type_assignment, source: :enumerable, source_type: "RESO::Member"
end
