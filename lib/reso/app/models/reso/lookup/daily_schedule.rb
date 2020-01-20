class RESO::Lookup::DailySchedule < RESO::Enumeration
  has_many :daily_schedule_assignments, foreign_key: :enumeration_id
  has_many :reso_prospectings, through: :daily_schedule_assignments, source: :enumerable, source_type: "RESO::Prospecting"
end
