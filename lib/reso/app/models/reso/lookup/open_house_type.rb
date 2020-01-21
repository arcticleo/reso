class RESO::Lookup::OpenHouseType < RESO::Enumeration
  has_one :open_house_type_assignment, foreign_key: :enumeration_id
  has_one :reso_open_houses, through: :open_house_type_assignment, source: :enumerable, source_type: "RESO::OpenHouse"
end
