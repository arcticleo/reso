class RESO::Lookup::EventTarget < RESO::Enumeration
  has_one :event_target_assignment, foreign_key: :enumeration_id
  has_one :reso_internet_tracking_event, through: :event_target_assignment, source: :enumerable, source_type: "RESO::InternetTracking::Event"
end
