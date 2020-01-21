class RESO::Lookup::OpenHouseStatus < RESO::Enumeration
  has_one :open_house_status_assignment, foreign_key: :enumeration_id
  has_one :reso_open_houses, through: :open_house_status_assignment, source: :enumerable, source_type: "RESO::OpenHouse"
end
