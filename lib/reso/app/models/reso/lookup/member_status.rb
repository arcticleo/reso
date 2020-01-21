class RESO::Lookup::MemberStatus < RESO::Enumeration
  has_one :member_status_assignment, foreign_key: :enumeration_id
  has_one :reso_members, through: :member_status_assignment, source: :enumerable, source_type: "RESO::Member"
end
