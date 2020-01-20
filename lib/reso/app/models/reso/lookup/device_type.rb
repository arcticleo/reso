class RESO::Lookup::DeviceType < RESO::Enumeration
  has_many :device_type_assignments, foreign_key: :enumeration_id
  has_many :reso_internet_tracking_actors, through: :device_type_assignments, source: :enumerable, source_type: "RESO::InternetTracking::Actor"
end
