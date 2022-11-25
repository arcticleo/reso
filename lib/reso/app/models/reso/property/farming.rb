class RESO::Property::Farming < ApplicationRecord
  belongs_to :property

  has_one :reso_farm_land_area_source_assignment, as: :parent, class_name: "FarmLandAreaSourceAssignment", dependent: :destroy
  has_one :farm_land_area_source,
    through: :reso_farm_land_area_source_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_farm_land_area_unit_assignment, as: :parent, class_name: "FarmLandAreaUnitAssignment", dependent: :destroy
  has_one :farm_land_area_units,
    through: :reso_farm_land_area_units_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_vegetation_assignments, as: :parent, class_name: "VegetationAssignment", dependent: :destroy
  has_many :vegetation,
    through: :reso_vegetation_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  def farm_land_area_source=(value)
    enum = RESO::FarmLandAreaSource.lookup_enum(value)
    RESO::FarmLandAreaSourceAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def farm_land_area_units=(value)
    enum = RESO::FarmLandAreaUnit.lookup_enum(value)
    RESO::FarmLandAreaUnitAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def vegetation=(values)
    enums = RESO::Vegetation.lookup_enums(values)
    RESO::VegetationAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
end
