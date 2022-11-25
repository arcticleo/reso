class RESO::Property::Structure < ApplicationRecord
  belongs_to :property

  has_one :reso_above_grade_finished_area_source_assignment, as: :parent, class_name: "AboveGradeFinishedAreaSourceAssignment", dependent: :destroy
  has_one :above_grade_finished_area_source,
    through: :reso_above_grade_finished_area_source_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_above_grade_finished_area_units_assignment, as: :parent, class_name: "AboveGradeFinishedAreaUnitsAssignment", dependent: :destroy
  has_one :above_grade_finished_area_units,
    through: :reso_above_grade_finished_area_units_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_accessibility_feature_assignments, as: :parent, class_name: "AccessibilityFeatureAssignment", dependent: :destroy
  has_many :accessibility_features,
    through: :reso_accessibility_feature_assignments,
    source_type: "RESO::Enumeration",
    source: :child
  
  has_many :reso_architectural_style_assignments, as: :parent, class_name: "ArchitecturalStyleAssignment", dependent: :destroy
  has_many :architectural_style,
    through: :reso_architectural_style_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_basement_assignments, as: :parent, class_name: "BasementAssignment", dependent: :destroy
  has_many :basement,
    through: :reso_basement_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_below_grade_finished_area_source_assignment, as: :parent, class_name: "BelowGradeFinishedAreaSourceAssignment", dependent: :destroy
  has_one :below_grade_finished_area_source,
    through: :reso_below_grade_finished_area_source_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_below_grade_finished_area_units_assignment, as: :parent, class_name: "BelowGradeFinishedAreaUnitsAssignment", dependent: :destroy
  has_one :below_grade_finished_area_units,
    through: :reso_below_grade_finished_area_units_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_body_type_assignments, as: :parent, class_name: "BodyTypeAssignment", dependent: :destroy
  has_many :body_type,
    through: :reso_body_type_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_building_area_source_assignment, as: :parent, class_name: "BuildingAreaSourceAssignment", dependent: :destroy
  has_one :building_area_source,
    through: :reso_building_area_source_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_building_area_units_assignment, as: :parent, class_name: "AreaUnitsAssignment", dependent: :destroy
  has_one :building_area_units,
    through: :reso_building_area_units_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_building_features_assignments, as: :parent, class_name: "BuildingFeaturesAssignment", dependent: :destroy
  has_many :building_features,
    through: :reso_building_features_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_common_walls_assignments, as: :parent, class_name: "CommonWallsAssignment", dependent: :destroy
  has_many :common_walls,
    through: :reso_common_walls_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_construction_materials_assignments, as: :parent, class_name: "ConstructionMaterialsAssignment", dependent: :destroy
  has_many :construction_materials,
    through: :reso_construction_materials_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_cooling_assignments, as: :parent, class_name: "CoolingAssignment", dependent: :destroy
  has_many :cooling,
    through: :reso_cooling_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_direction_faces_assignment, as: :parent, class_name: "DirectionFacesAssignment", dependent: :destroy
  has_one :direction_faces,
    through: :reso_direction_faces_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_door_features_assignments, as: :parent, class_name: "DoorFeaturesAssignment", dependent: :destroy
  has_many :door_features,
    through: :reso_door_features_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_exterior_features_assignments, as: :parent, class_name: "ExteriorFeaturesAssignment", dependent: :destroy
  has_many :exterior_features,
    through: :reso_exterior_features_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_fireplace_features_assignments, as: :parent, class_name: "FireplaceFeatureAssignment", dependent: :destroy
  has_many :fireplace_features,
    through: :reso_fireplace_features_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_flooring_assignments, as: :parent, class_name: "FlooringAssignment", dependent: :destroy
  has_many :flooring,
    through: :reso_flooring_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_foundation_details_assignments, as: :parent, class_name: "FoundationDetailsAssignment", dependent: :destroy
  has_many :foundation_details,
    through: :reso_foundation_details_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_heating_assignments, as: :parent, class_name: "HeatingAssignment", dependent: :destroy
  has_many :heating,
    through: :reso_heating_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_interior_features_assignments, as: :parent, class_name: "InteriorOrRoomFeatureAssignment", dependent: :destroy
  has_many :interior_features,
    through: :reso_interior_features_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_leasable_area_units_assignment, as: :parent, class_name: "AreaUnitsAssignment", dependent: :destroy
  has_one :leasable_area_units,
    through: :reso_leasable_area_units_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_levels_assignments, as: :parent, class_name: "LevelsAssignment", dependent: :destroy
  has_many :levels,
    through: :reso_levels_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_living_area_source_assignment, as: :parent, class_name: "LivingAreaSourceAssignment", dependent: :destroy
  has_one :living_area_source,
    through: :reso_living_area_source_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_living_area_units_assignment, as: :parent, class_name: "AreaUnitsAssignment", dependent: :destroy
  has_one :living_area_units,
    through: :reso_living_area_units_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_mobile_dim_units_assignment, as: :parent, class_name: "MobileDimUnitsAssignment", dependent: :destroy
  has_one :mobile_dim_units,
    through: :reso_mobile_dim_units_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_other_structures_assignments, as: :parent, class_name: "OtherStructureAssignment", dependent: :destroy
  has_many :other_structures,
    through: :reso_other_structures_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_parking_features_assignments, as: :parent, class_name: "ParkingFeatureAssignment", dependent: :destroy
  has_many :parking_features,
    through: :reso_parking_features_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_patio_and_porch_features_assignments, as: :parent, class_name: "PatioAndPorchFeatureAssignment", dependent: :destroy
  has_many :patio_and_porch_features,
    through: :reso_patio_and_porch_features_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_property_condition_assignments, as: :parent, class_name: "PropertyConditionAssignment", dependent: :destroy
  has_many :property_condition,
    through: :reso_property_condition_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_roof_assignments, as: :parent, class_name: "RoofAssignment", dependent: :destroy
  has_many :roof,
    through: :reso_roof_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_skirt_assignments, as: :parent, class_name: "SkirtAssignment", dependent: :destroy
  has_many :skirt,
    through: :reso_skirt_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_structure_type_assignments, as: :parent, class_name: "StructureTypeAssignment", dependent: :destroy
  has_many :structure_type,
    through: :reso_structure_type_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_window_features_assignments, as: :parent, class_name: "WindowFeaturesAssignment", dependent: :destroy
  has_many :window_features,
    through: :reso_window_features_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_year_built_source_assignment, as: :parent, class_name: "YearBuiltSourceAssignment", dependent: :destroy
  has_one :year_built_source,
    through: :reso_year_built_source_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  def above_grade_finished_area_source=(value)
    enum = RESO::AboveGradeFinishedAreaSource.lookup_enum(value)
    RESO::AboveGradeFinishedAreaSourceAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def above_grade_finished_area_units=(value)
    enum = RESO::AboveGradeFinishedAreaUnits.lookup_enum(value)
    RESO::AboveGradeFinishedAreaUnitsAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def accessibility_features=(values)
    enums = RESO::AccessibilityFeature.lookup_enums(values)
    RESO::AccessibilityFeatureAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def architectural_style=(values)
    enums = RESO::ArchitecturalStyle.lookup_enums(values)
    RESO::ArchitecturalStyleAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def basement=(values)
    enums = RESO::Basement.lookup_enums(values)
    RESO::BasementAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def below_grade_finished_area_source=(value)
    enum = RESO::BelowGradeFinishedAreaSource.lookup_enum(value)
    RESO::BelowGradeFinishedAreaSourceAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def below_grade_finished_area_units=(value)
    enum = RESO::BelowGradeFinishedAreaUnits.lookup_enum(value)
    RESO::BelowGradeFinishedAreaUnitsAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def body_type=(values)
    enums = RESO::BodyType.lookup_enums(values)
    RESO::BodyTypeAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def building_area_source=(value)
    enum = RESO::BuildingAreaSource.lookup_enum(value)
    RESO::BuildingAreaSourceAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def building_area_units=(value)
    enum = RESO::AreaUnits.lookup_enum(value)
    RESO::AreaUnitsAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def building_features=(values)
    enums = RESO::BuildingFeatures.lookup_enums(values)
    RESO::BuildingFeaturesAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def common_walls=(values)
    enums = RESO::CommonWalls.lookup_enums(values)
    RESO::CommonWallsAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def construction_materials=(values)
    enums = RESO::ConstructionMaterial.lookup_enums(values)
    RESO::ConstructionMaterialsAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def cooling=(values)
    enums = RESO::Cooling.lookup_enums(values)
    RESO::CoolingAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def direction_faces=(value)
    enum = RESO::DirectionFaces.lookup_enum(value)
    RESO::DirectionFacesAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def door_features=(values)
    enums = RESO::DoorFeatures.lookup_enums(values)
    RESO::DoorFeaturesAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def exterior_features=(values)
    enums = RESO::ExteriorFeature.lookup_enums(values)
    RESO::ExteriorFeaturesAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def fireplace_features=(values)
    enums = RESO::FireplaceFeature.lookup_enums(values)
    RESO::FireplaceFeatureAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def flooring=(values)
    enums = RESO::Flooring.lookup_enums(values)
    RESO::FlooringAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def foundation_details=(values)
    enums = RESO::FoundationDetail.lookup_enums(values)
    RESO::FoundationDetailAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def heating=(values)
    enums = RESO::Heating.lookup_enums(values)
    RESO::HeatingAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def interior_features=(values)
    enums = RESO::InteriorOrRoomFeature.lookup_enums(values)
    RESO::InteriorOrRoomFeatureAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def leasable_area_units=(value)
    enum = RESO::AreaUnits.lookup_enum(value)
    RESO::AreaUnitsAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def levels=(values)
    enums = RESO::Levels.lookup_enums(values)
    RESO::LevelsAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def living_area_source=(value)
    enum = RESO::LivingAreaSource.lookup_enum(value)
    RESO::LivingAreaSourceAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def living_area_units=(value)
    enum = RESO::AreaUnits.lookup_enum(value)
    RESO::AreaUnitsAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def mobile_dim_units=(value)
    enum = RESO::MobileDimUnits.lookup_enum(value)
    RESO::MobileDimUnitsAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

  def other_structures=(values)
    enums = RESO::OtherStructure.lookup_enums(values)
    RESO::OtherStructureAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def parking_features=(values)
    enums = RESO::ParkingFeature.lookup_enums(values)
    RESO::ParkingFeatureAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def patio_and_porch_features=(values)
    enums = RESO::PatioAndPorchFeature.lookup_enums(values)
    RESO::PatioAndPorchFeatureAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def property_condition=(values)
    enums = RESO::PropertyCondition.lookup_enums(values)
    RESO::PropertyConditionAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def roof=(values)
    enums = RESO::Roof.lookup_enums(values)
    RESO::RoofAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def skirt=(values)
    enums = RESO::Skirt.lookup_enums(values)
    RESO::SkirtAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def structure_type=(values)
    enums = RESO::StructureType.lookup_enums(values)
    RESO::StructureTypeAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def window_features=(values)
    enums = RESO::WindowFeature.lookup_enums(values)
    RESO::WindowFeaturesAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def year_built_source=(value)
    enum = RESO::YearBuiltSource.lookup_enum(value)
    RESO::YearBuiltSourceAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end

end
