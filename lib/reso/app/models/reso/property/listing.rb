class RESO::Property::Listing < ApplicationRecord
  belongs_to :property
  has_one :price, dependent: :destroy
  has_one :remarks, dependent: :destroy
  has_one :showing, dependent: :destroy

  has_one :reso_listing_agreement_assignment, as: :parent, class_name: "ListingAgreementAssignment", dependent: :destroy
  has_one :listing_agreement,
    through: :reso_listing_agreement_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_listing_association_assignment, as: :parent, class_name: "ListingAssociationAssignment", dependent: :destroy
  has_one :listing_association,
    through: :reso_listing_association_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_listing_service_assignment, as: :parent, class_name: "ListingServiceAssignment", dependent: :destroy
  has_one :listing_service,
    through: :reso_listing_service_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_listing_url_description_assignment, as: :parent, class_name: "ListingURLDescriptionAssignment", dependent: :destroy
  has_one :listing_url_description,
    through: :reso_url_description_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_mls_status_assignment, as: :parent, class_name: "MlsStatusAssignment", dependent: :destroy
  has_one :mls_status,
    through: :reso_mls_status_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_standard_status_assignment, as: :parent, class_name: "StandardStatusAssignment", dependent: :destroy
  has_one :standard_status,
    through: :reso_standard_status_assignment,
    source_type: "RESO::Enumeration",
    source: :child
    
  def listing_agreement=(value)
    enum = RESO::ListingAgreement.lookup_enum(value)
    RESO::ListingAgreementAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def listing_association=(value)
    enum = RESO::ListingAssociation.lookup_enum(value)
    RESO::ListingAssociationAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def listing_service=(value)
    enum = RESO::ListingService.lookup_enum(value)
    RESO::ListingServiceAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def listing_url_description=(value)
    enum = RESO::ListingURLDescription.lookup_enum(value)
    RESO::ListingUELDescriptionAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def mls_status=(value)
    enum = RESO::MlsStatus.lookup_enum(value)
    RESO::MlsStatusAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def standard_status=(value)
    enum = RESO::StandardStatus.lookup_enum(value)
    RESO::StandardStatusAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

end
