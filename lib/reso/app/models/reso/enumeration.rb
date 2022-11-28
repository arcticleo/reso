class RESO::Enumeration < ApplicationRecord
  def self.lookup_enum(value, is_open = true)
    enum = self.find_by(value: value.gsub(/\W/, ""))
    enum = self.find_by(display_name: value) if enum.blank?
    enum = self.where(value: value.gsub(/\W/, ""), display_name: value).first_or_create if enum.blank? && is_open
    return enum
  end
  
  def self.lookup_enums(values, is_open = true)
    arr = []
    values = values.split(",").map(&:strip) if values.class.eql?(String)
    if values.class.eql?(Array) && !values.blank?
      values.each do |value|
        enum = self.lookup_enum(value, is_open: is_open)
        arr << enum unless enum.blank?
      end
    end
    return arr
  end
end

# class RESO::AccessibilityFeature < RESO::Enumeration
# end

# class RESO::ActorType < RESO::Enumeration
# end

# class RESO::Appliance < RESO::Enumeration
#   has_many :reso_appliance_assignments, as: :child, class_name: "ApplianceAssignment"
#   has_many :equipment,
#     through: :reso_appliance_assignments,
#     source: :parent,
#     source_type: "RESO::Property::Equipment"
# end

# class RESO::AreaSource < RESO::Enumeration
# end

# class RESO::ArchitecturalStyle < RESO::Enumeration
# end

# class RESO::AreaUnits < RESO::Enumeration
# end

# class RESO::AssociationAmenity < RESO::Enumeration
# end

# class RESO::AssociationFeeIncludes < RESO::Enumeration
# end

# class RESO::Attended < RESO::Enumeration
# end

# class RESO::Basement < RESO::Enumeration
# end

# class RESO::BodyType < RESO::Enumeration
# end

# class RESO::BuildingFeatures < RESO::Enumeration
# end

# class RESO::BusinessType < RESO::Enumeration
# end

# class RESO::BuyerAgentDesignation < RESO::Enumeration
# end

# class RESO::BuyerFinancing < RESO::Enumeration
# end

# class RESO::ChangeType < RESO::Enumeration
# end

# class RESO::City < RESO::Enumeration
# end

# class RESO::ClassName < RESO::Enumeration
# end

# class RESO::CoBuyerAgentDesignation < RESO::Enumeration
# end

# class RESO::CoListAgentDesignation < RESO::Enumeration
# end

# class RESO::CommonInterest < RESO::Enumeration
# end

# class RESO::CommonWalls < RESO::Enumeration
# end

# class RESO::CommunityFeature < RESO::Enumeration
# end

# class RESO::CompensationType < RESO::Enumeration
# end

# class RESO::Concessions < RESO::Enumeration
# end

# class RESO::ConstructionMaterial < RESO::Enumeration
# end

# class RESO::ContactListingPreference < RESO::Enumeration
# end

# class RESO::ContactStatus < RESO::Enumeration
# end

# class RESO::ContactType < RESO::Enumeration
# end

# class RESO::Cooling < RESO::Enumeration
# end

# class RESO::Country < RESO::Enumeration
# end

# class RESO::CountyOrParish < RESO::Enumeration
# end

# class RESO::CurrentFinancing < RESO::Enumeration
# end

# class RESO::CurrentUse < RESO::Enumeration
# end

# class RESO::DailySchedule < RESO::Enumeration
# end

# class RESO::DevelopmentStatus < RESO::Enumeration
# end

# class RESO::DeviceType < RESO::Enumeration
# end

# class RESO::DirectionFaces < RESO::Enumeration
# end

# class RESO::DoorFeature < RESO::Enumeration
# end

# class RESO::Electric < RESO::Enumeration
# end

# class RESO::ElementarySchool < RESO::Enumeration
# end

# class RESO::ElementarySchoolDistrict < RESO::Enumeration
# end

# class RESO::ElevationUnit < RESO::Enumeration
# end

# class RESO::EventTarget < RESO::Enumeration
# end

# class RESO::EventType < RESO::Enumeration
# end

# class RESO::ExistingLeaseType < RESO::Enumeration
# end

# class RESO::ExteriorFeature < RESO::Enumeration
# end

# class RESO::FeeFrequency < RESO::Enumeration
# end

# class RESO::Fencing < RESO::Enumeration
# end

# class RESO::FinancialDataSource < RESO::Enumeration
# end

# class RESO::FireplaceFeature < RESO::Enumeration
# end

# class RESO::Flooring < RESO::Enumeration
# end

# class RESO::FoundationDetail < RESO::Enumeration
# end

# class RESO::FrontageType < RESO::Enumeration
# end

# class RESO::Furnished < RESO::Enumeration
# end

# class RESO::GreenBuildingVerificationType < RESO::Enumeration
# end

# class RESO::GreenEnergyEfficient < RESO::Enumeration
# end

# class RESO::GreenEnergyGeneration < RESO::Enumeration
# end

# class RESO::GreenIndoorAirQuality < RESO::Enumeration
# end

# class RESO::GreenSustainability < RESO::Enumeration
# end

# class RESO::GreenVerificationSource < RESO::Enumeration
# end

# class RESO::GreenVerificationStatus < RESO::Enumeration
# end

# class RESO::GreenWaterConservation < RESO::Enumeration
# end

# class RESO::Heating < RESO::Enumeration
# end

# class RESO::HighSchool < RESO::Enumeration
# end

# class RESO::HighSchoolDistrict < RESO::Enumeration
# end

# class RESO::HorseAmenity < RESO::Enumeration
# end

# class RESO::HoursDaysOfOperation < RESO::Enumeration
# end

# class RESO::ImageOf < RESO::Enumeration
# end

# class RESO::IncomeIncludes < RESO::Enumeration
# end

# class RESO::InteriorOrRoomFeature < RESO::Enumeration
# end

# class RESO::LaborInformation < RESO::Enumeration
# end

# class RESO::Languages < RESO::Enumeration
# end

# class RESO::LaundryFeature < RESO::Enumeration
# end

# class RESO::LeaseRenewalCompensation < RESO::Enumeration
# end

# class RESO::LeaseTerm < RESO::Enumeration
# end

# class RESO::Levels < RESO::Enumeration
# end

# class RESO::LinearUnits < RESO::Enumeration
# end

# class RESO::ListAgentDesignation < RESO::Enumeration
# end

# class RESO::ListingAgreement < RESO::Enumeration
#   has_many :reso_listing_agreement_assignments, as: :child, class_name: "ListingAgreementAssignment"
#   has_many :listings,
#     through: :reso_listing_agreement_assignments,
#     source: :parent,
#     source_type: "RESO::Property::Listing"
# end

# class RESO::ListingAssociation < RESO::Enumeration
#   has_many :reso_listing_association_assignments, as: :child, class_name: "ListingAssociationAssignment"
#   has_many :listings,
#     through: :reso_listing_association_assignments,
#     source: :parent,
#     source_type: "RESO::Property::Listing"
# end

# class RESO::ListingService < RESO::Enumeration
#   has_many :reso_listing_service_assignments, as: :child, class_name: "ListingServiceAssignment"
#   has_many :listings,
#     through: :reso_listing_service_assignments,
#     source: :parent,
#     source_type: "RESO::Property::Listing"
# end

# class RESO::ListingTerms < RESO::Enumeration
# end

# class RESO::LockBoxType < RESO::Enumeration
# end

# class RESO::LotDimensionsSource < RESO::Enumeration
# end

# class RESO::LotFeature < RESO::Enumeration
# end

# class RESO::LotSizeSource < RESO::Enumeration
# end

# class RESO::LotSizeUnit < RESO::Enumeration
# end

# class RESO::MediaCategory < RESO::Enumeration
# end

# class RESO::MediaType < RESO::Enumeration
# end

# class RESO::MemberDesignation < RESO::Enumeration
# end

# class RESO::MemberOtherPhoneType < RESO::Enumeration
# end

# class RESO::MemberStatus < RESO::Enumeration
# end

# class RESO::MemberType < RESO::Enumeration
# end

# class RESO::MiddleOrJuniorSchool < RESO::Enumeration
# end

# class RESO::MiddleOrJuniorSchoolDistrict < RESO::Enumeration
# end

# class RESO::MlsAreaMajor < RESO::Enumeration
# end

# class RESO::MlsAreaMinor < RESO::Enumeration
# end

# class RESO::MlsStatus < RESO::Enumeration
#   has_many :reso_mls_status_assignments, as: :child, class_name: "MlsStatusAssignment"
#   has_many :listings,
#     through: :reso_mls_status_assignments,
#     source: :parent,
#     source_type: "RESO::Property::Listing"
# end

# class RESO::NotedBy < RESO::Enumeration
# end

# class RESO::ObjectIdType < RESO::Enumeration
# end

# class RESO::ObjectType < RESO::Enumeration
# end

# class RESO::OccupantType < RESO::Enumeration
# end

# class RESO::OfficeBranchType < RESO::Enumeration
# end

# class RESO::OfficeStatus < RESO::Enumeration
# end

# class RESO::OfficeType < RESO::Enumeration
# end

# class RESO::OpenHouseStatus < RESO::Enumeration
# end

# class RESO::OpenHouseType < RESO::Enumeration
# end

# class RESO::OperatingExpenseIncludes < RESO::Enumeration
# end

# class RESO::OtherEquipment < RESO::Enumeration
#   has_many :reso_other_equipment_assignments, as: :child, class_name: "OtherEquipmentAssignment"
#   has_many :equipment,
#     through: :reso_other_equipment_assignments,
#     source: :parent,
#     source_type: "RESO::Property::Equipment"
# end

# class RESO::OtherPhoneType < RESO::Enumeration
# end

# class RESO::OtherStructure < RESO::Enumeration
# end

# class RESO::OwnerPays < RESO::Enumeration
# end

# class RESO::OwnershipType < RESO::Enumeration
# end

# class RESO::ParkingFeature < RESO::Enumeration
# end

# class RESO::PatioAndPorchFeature < RESO::Enumeration
# end

# class RESO::Permission < RESO::Enumeration
# end

# class RESO::PetsAllowed < RESO::Enumeration
# end

# class RESO::PoolFeature < RESO::Enumeration
# end

# class RESO::Possession < RESO::Enumeration
# end

# class RESO::PossibleUse < RESO::Enumeration
# end

# class RESO::PostalCity < RESO::Enumeration
# end

# class RESO::PowerProductionAnnualStatus < RESO::Enumeration
# end

# class RESO::PowerProductionType < RESO::Enumeration
# end

# class RESO::PreferredAddress < RESO::Enumeration
# end

# class RESO::PreferredPhone < RESO::Enumeration
# end

# class RESO::PropertyCondition < RESO::Enumeration
# end

# class RESO::PropertySubType < RESO::Enumeration
# end

# class RESO::PropertyType < RESO::Enumeration
# end

# class RESO::QueueTransactionType < RESO::Enumeration
# end

# class RESO::ReasonActiveOrDisabled < RESO::Enumeration
# end

# class RESO::RentIncludes < RESO::Enumeration
# end

# class RESO::ResourceName < RESO::Enumeration
# end

# class RESO::RoadFrontageType < RESO::Enumeration
# end

# class RESO::RoadResponsibility < RESO::Enumeration
# end

# class RESO::RoadSurfaceType < RESO::Enumeration
# end

# class RESO::Roof < RESO::Enumeration
# end

# class RESO::RoomType < RESO::Enumeration
# end

# class RESO::RuleFormat < RESO::Enumeration
# end

# class RESO::ScheduleType < RESO::Enumeration
# end

# class RESO::SearchQueryType < RESO::Enumeration
# end

# class RESO::SecurityFeature < RESO::Enumeration
#   has_many :reso_security_feature_assignments, as: :child, class_name: "SecurityFeatureAssignment"
#   has_many :equipment,
#     through: :reso_security_feature_assignments,
#     source: :parent,
#     source_type: "RESO::Property::Equipment"
# end

# class RESO::Sewer < RESO::Enumeration
# end

# class RESO::ShowingContactType < RESO::Enumeration
# end

# class RESO::ShowingRequirement < RESO::Enumeration
# end

# class RESO::Skirt < RESO::Enumeration
# end

# class RESO::SocialMediaType < RESO::Enumeration
# end

# class RESO::SpaFeature < RESO::Enumeration
# end

# class RESO::SpecialLicense < RESO::Enumeration
# end

# class RESO::SpecialListingCondition < RESO::Enumeration
# end

# class RESO::StandardStatus < RESO::Enumeration
#   has_many :reso_standard_status_assignments, as: :child, class_name: "StandardStatusAssignment"
#   has_many :listings,
#     through: :reso_standard_status_assignments,
#     source: :parent,
#     source_type: "RESO::Property::Listing"
# end

# class RESO::StateOrProvince < RESO::Enumeration
# end

# class RESO::StreetDirPrefix < RESO::Enumeration
# end

# class RESO::StreetDirSuffix < RESO::Enumeration
# end

# class RESO::StreetDirection < RESO::Enumeration
# end

# class RESO::StreetSuffix < RESO::Enumeration
# end

# class RESO::StructureType < RESO::Enumeration
# end

# class RESO::SyndicateTo < RESO::Enumeration
# end

# class RESO::TaxStatusCurrent < RESO::Enumeration
# end

# class RESO::TeamMemberType < RESO::Enumeration
# end

# class RESO::TeamStatus < RESO::Enumeration
# end

# class RESO::TenantPays < RESO::Enumeration
# end

# class RESO::UnitsFurnished < RESO::Enumeration
# end

# class RESO::UnitTypeType < RESO::Enumeration
# end

# class RESO::Utilities < RESO::Enumeration
# end

# class RESO::Vegetation < RESO::Enumeration
# end

# class RESO::View < RESO::Enumeration
# end

# class RESO::WaterfrontFeature < RESO::Enumeration
# end

# class RESO::WaterSource < RESO::Enumeration
# end

# class RESO::WindowFeature < RESO::Enumeration
# end

# class RESO::YearBuiltSource < RESO::Enumeration
# end


