class RESO::Lookup::ObjectIdType < RESO::Enumeration
  has_one :object_id_type_assignment, foreign_key: :enumeration_id
  has_one :reso_internet_tracking_object, through: :object_id_type_assignment, source: :enumerable, source_type: "RESO::InternetTracking::Object"
end
