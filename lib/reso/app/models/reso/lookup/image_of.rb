class RESO::Lookup::ImageOf < RESO::Enumeration
  has_one :image_of_assignments, foreign_key: :enumeration_id
  has_one :reso_media, through: :image_of_assignment, source: :enumerable, source_type: "RESO::Media"
end
