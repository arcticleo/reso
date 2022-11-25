class RESO::Property::Characteristics < ApplicationRecord
  belongs_to :property

  has_many :reso_community_feature_assignments, as: :parent, class_name: "CommunityFeatureAssignment", dependent: :destroy
  has_many :community_features,
    through: :reso_community_feature_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_current_use_assignments, as: :parent, class_name: "CurrentUseAssignment", dependent: :destroy
  has_many :current_use,
    through: :reso_current_use_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_development_status_assignments, as: :parent, class_name: "DevelopmentStatusAssignment", dependent: :destroy
  has_many :development_status,
    through: :reso_development_status_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_fencing_assignments, as: :parent, class_name: "FencingAssignment", dependent: :destroy
  has_many :fencing,
    through: :reso_fencing_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_frontage_type_assignments, as: :parent, class_name: "FrontageTypeAssignment", dependent: :destroy
  has_many :frontage_type,
    through: :reso_frontage_type_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_furnished_assignment, as: :parent, class_name: "FurnishedAssignment", dependent: :destroy
  has_one :furnished,
    through: :reso_furnished_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_horse_amenity_assignments, as: :parent, class_name: "HorseAmenityAssignment", dependent: :destroy
  has_many :horse_amenities,
    through: :reso_horse_amenity_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_land_lease_amount_frequency_assignment, as: :parent, class_name: "LandLeaseAmountFrequencyAssignment", dependent: :destroy
  has_one :land_lease_amount_frequency,
    through: :reso_land_lease_amount_frequency_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_laundry_feature_assignments, as: :parent, class_name: "LaundryFeatureAssignment", dependent: :destroy
  has_many :laundry_features,
    through: :reso_laundry_feature_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_lease_term_assignment, as: :parent, class_name: "LeaseTermAssignment", dependent: :destroy
  has_one :lease_term,
    through: :reso_lease_term_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_lot_dimensions_source_assignment, as: :parent, class_name: "LotDimensionsSourceAssignment", dependent: :destroy
  has_one :lot_dimensions_source,
    through: :reso_lot_dimensions_source_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_lot_feature_assignments, as: :parent, class_name: "LotFeatureAssignment", dependent: :destroy
  has_many :lot_features,
    through: :reso_lot_feature_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_lot_size_source_assignment, as: :parent, class_name: "LotSizeSourceAssignment", dependent: :destroy
  has_one :lot_size_source,
    through: :reso_lot_size_source_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_lot_size_unit_assignment, as: :parent, class_name: "LotSizeUnitAssignment", dependent: :destroy
  has_one :lot_size_units,
    through: :reso_lot_size_unit_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_pool_feature_assignments, as: :parent, class_name: "PoolFeatureAssignment", dependent: :destroy
  has_many :pool_features,
    through: :reso_pool_feature_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_possible_use_assignments, as: :parent, class_name: "PossibleUseAssignment", dependent: :destroy
  has_many :possible_use,
    through: :reso_possible_use_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_road_frontage_type_assignments, as: :parent, class_name: "RoadFrontageTypeAssignment", dependent: :destroy
  has_many :road_frontage_type,
    through: :reso_road_frontage_type_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_road_responsibility_assignments, as: :parent, class_name: "RoadResponsibilityAssignment", dependent: :destroy
  has_many :road_responsibility,
    through: :reso_road_responsibility_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_road_surface_type_assignments, as: :parent, class_name: "RoadSurfaceTypeAssignment", dependent: :destroy
  has_many :road_surface_type,
    through: :reso_road_surface_type_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_spa_feature_assignments, as: :parent, class_name: "SpaFeatureAssignment", dependent: :destroy
  has_many :spa_features,
    through: :reso_spa_feature_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_units_furnished_assignment, as: :parent, class_name: "UnitsFurnishedAssignment", dependent: :destroy
  has_one :units_furnished,
    through: :reso_units_furnished_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_view_assignments, as: :parent, class_name: "ViewAssignment", dependent: :destroy
  has_many :view,
    through: :reso_view_assignments,
    source_type: "RESO::Enumeration",
    source: :child


  def community_features=(values)
    enums = RESO::CommunityFeature.lookup_enums(values)
    RESO::CommunityFeatureAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def current_use=(values)
    enums = RESO::CurrentUse.lookup_enums(values)
    RESO::CurrentUseAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def development_status=(values)
    enums = RESO::DevelopmentStatus.lookup_enums(values)
    RESO::DevelopmentStatusAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def fencing=(values)
    enums = RESO::Fencing.lookup_enums(values)
    RESO::FencingAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def frontage_type=(values)
    enums = RESO::FrontageType.lookup_enums(values)
    RESO::FrontageTypeAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def furnished=(value)
    enum = RESO::Furnished.lookup_enum(value)
    RESO::FurnishedAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
  def horse_amenities=(values)
    enums = RESO::HorseAmenity.lookup_enums(values)
    RESO::HorseAmenityAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def land_lease_amount_frequency=(value)
    enum = RESO::LandLeaseAmountFrequency.lookup_enum(value)
    RESO::LandLeaseAmountFrequencyAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
  def laundry_features=(values)
    enums = RESO::LaundryFeature.lookup_enums(values)
    RESO::LaundryFeatureAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def lease_term=(value)
    enum = RESO::LeaseTerm.lookup_enum(value)
    RESO::LeaseTermAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
  def lot_dimensions_source=(value)
    enum = RESO::LotDimensionsSource.lookup_enum(value)
    RESO::LotDimensionsSourceAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
  def lot_features=(values)
    enums = RESO::LotFeature.lookup_enums(values)
    RESO::LotFeatureAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def lot_size_source=(value)
    enum = RESO::LotSizeSource.lookup_enum(value)
    RESO::LotSizeSourceAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
  def lot_size_units=(value)
    enum = RESO::LotSizeUnit.lookup_enum(value)
    RESO::LotSizeUnitAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
  def pool_features=(values)
    enums = RESO::PoolFeature.lookup_enums(values)
    RESO::PoolFeatureAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def possible_use=(values)
    enums = RESO::PossibleUse.lookup_enums(values)
    RESO::PossibleUseAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def road_frontage_type=(values)
    enums = RESO::RoadFrontageType.lookup_enums(values)
    RESO::RoadFrontageTypeAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def road_responsibility=(values)
    enums = RESO::RoadResponsibility.lookup_enums(values)
    RESO::RoadResponsibilityAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def road_surface_type=(values)
    enums = RESO::RoadSurfaceType.lookup_enums(values)
    RESO::RoadSurfaceTypeAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def spa_features=(values)
    enums = RESO::SpaFeature.lookup_enums(values)
    RESO::SpaFeatureAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def units_furnished=(value)
    enum = RESO::UnitsFurnished.lookup_enum(value)
    RESO::UnitsFurnishedAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
  def view=(values)
    enums = RESO::View.lookup_enums(values)
    RESO::ViewAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end
  
  def waterfront_features=(values)
    enums = RESO::WaterfrontFeature.lookup_enums(values)
    RESO::WaterfrontFeatureAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

end
