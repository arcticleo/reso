class RESO::Lookup::MemberOtherPhoneType < RESO::Enumeration
  has_one :member_other_phone_type_assignment, foreign_key: :enumeration_id
  has_one :reso_members, through: :member_other_phone_type_assignment, source: :enumerable, source_type: "RESO::Member"
end
