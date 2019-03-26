class RESO::Lookup::ActorType < RESO::Enumeration
  has_many :actor_type_assignments, foreign_key: :enumeration_id
  has_many :reso_internet_tracking_actor, through: :actor_type_assignments, source: :enumerable, source_type: "RESO::InternetTracking::Actor"
end
