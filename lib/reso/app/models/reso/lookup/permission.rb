class RESO::Lookup::Permission < RESO::Enumeration
  has_many :permission_assignments, foreign_key: :enumeration_id
  has_many :reso_media, through: :permission_assignments, source: :enumerable, source_type: "RESO::Media"
end
