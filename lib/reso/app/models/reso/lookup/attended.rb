class RESO::Lookup::Attended < RESO::Enumeration
  has_many :attended_assignments, foreign_key: :enumeration_id
  has_many :reso_open_houses, through: :attended_assignments, source: :enumerable, source_type: "RESO::OpenHouse"
end
