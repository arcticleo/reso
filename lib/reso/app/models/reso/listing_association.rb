class RESO::ListingAssociation < RESO::Enumeration
  has_many :reso_listing_association_assignments, as: :child, class_name: "ListingAssociationAssignment"
  has_many :listings,
    through: :reso_listing_association_assignments,
    source: :parent,
    source_type: "RESO::Property::Listing"
end
