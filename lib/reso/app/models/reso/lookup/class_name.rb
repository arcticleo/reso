class RESO::Lookup::ClassName < RESO::Enumeration
  has_one :class_name_assignment, foreign_key: :enumeration_id
  has_one :reso_media, through: :class_name_assignment, source: :enumerable, source_type: "RESO::Media"
end
