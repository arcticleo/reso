class RESO::MlsStatus < RESO::Enumeration
  has_many :reso_mls_status_assignments, as: :child, class_name: "MlsStatusAssignment"
  has_many :listings,
    through: :reso_mls_status_assignments,
    source: :parent,
    source_type: "RESO::Property::Listing"
end
