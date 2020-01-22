class RESO::Lookup::TeamMemberType < RESO::Enumeration
  has_one :team_member_type_assignment, foreign_key: :enumeration_id
  has_one :reso_team_member, through: :team_member_type_assignment, source: :enumerable, source_type: "RESO::TeamMember"
end
