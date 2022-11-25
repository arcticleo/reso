class RESO::StandardStatus < RESO::Enumeration
  has_many :reso_standard_status_assignments, as: :child, class_name: "StandardStatusAssignment"
  has_many :listings,
    through: :reso_standard_status_assignments,
    source: :parent,
    source_type: "RESO::Property::Listing"
end
