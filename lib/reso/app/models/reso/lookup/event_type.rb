class RESO::Lookup::EventType < RESO::Enumeration
  has_one :event_type_assignment, foreign_key: :enumeration_id
  has_one :reso_internet_tracking_event, through: :event_type_assignment, source: :enumerable, source_type: "RESO::InternetTracking::Event"
end
