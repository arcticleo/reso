class RESO::Lookup::MemberDesignation < RESO::Enumeration
  has_many :member_designation_assignments, foreign_key: :enumeration_id
  has_many :reso_members, through: :member_designation_assignments, source: :enumerable, source_type: "RESO::Member"
end
