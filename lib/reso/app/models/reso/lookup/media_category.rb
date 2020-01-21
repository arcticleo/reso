class RESO::Lookup::MediaCategory < RESO::Enumeration
  has_one :media_category_assignments, foreign_key: :enumeration_id
  has_one :reso_media, through: :media_category_assignment, source: :enumerable, source_type: "RESO::Media"
end
