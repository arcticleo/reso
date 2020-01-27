class RESO::Lookup::ReasonActiveOrDisabled < RESO::Enumeration
  has_one :reason_active_or_disabled_assignment, foreign_key: :enumeration_id
  has_one :reso_prospecting, through: :reason_active_or_disabled_assignment, source: :enumerable, source_type: "RESO::Prospecting"
end
