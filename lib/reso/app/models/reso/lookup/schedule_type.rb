class RESO::Lookup::ScheduleType < RESO::Enumeration
  has_one :schedule_type_assignment, foreign_key: :enumeration_id
  has_one :reso_prospecting, through: :schedule_type_assignment, source: :enumerable, source_type: "RESO::Prospecting"
end
