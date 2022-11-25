class RESO::Property::Location::Area < ApplicationRecord
  belongs_to :location

  has_one :reso_mls_area_major_assignment, as: :parent, class_name: "MlsAreaMajorAssignment", dependent: :destroy
  has_one :mls_area_major,
    through: :reso_mls_area_major_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_mls_area_minor_assignment, as: :parent, class_name: "MlsAreaMinorAssignment", dependent: :destroy
  has_one :mls_area_minor,
    through: :reso_mls_area_minor_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  def mls_area_major=(value)
    enum = RESO::MlsAreaMajor.lookup_enum(value)
    RESO::MlsAreaMajorAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def mls_area_minor=(value)
    enum = RESO::MlsAreaMinor.lookup_enum(value)
    RESO::MlsAreaMinorAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

end
