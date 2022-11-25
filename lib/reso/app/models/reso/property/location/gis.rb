class RESO::Property::Location::GIS < ApplicationRecord
  belongs_to :location

  has_one :reso_elevation_unit_assignment, as: :parent, class_name: "ElevationUnitAssignment", dependent: :destroy
  has_one :elevation_units,
    through: :reso_elevation_unit_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  def elevation_units=(value)
    enum = RESO::ElevationUnit.lookup_enum(value)
    RESO::ElevationUnitAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

end
