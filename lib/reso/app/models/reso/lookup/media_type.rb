class RESO::Lookup::MediaType < RESO::Enumeration
  has_one :media_type_assignments, foreign_key: :enumeration_id
  has_one :reso_media, through: :media_type_assignment, source: :enumerable, source_type: "RESO::Media"
end
