class RESO::ParentChildAssignment < ApplicationRecord
  belongs_to :parent, polymorphic: true
  belongs_to :child, polymorphic: true
  
  def self.single_assignment(parent:, child:)
    unless child.blank?
      assignment = self.find_or_initialize_by(parent: parent)
      assignment.child = child
      assignment.save
    end
  end

  def self.multi_assignment(parent:, children:)
    unless children.blank?
      children.each do |enum|
        assignment = self.find_or_initialize_by(parent: parent, child: enum) unless enum.blank?
        assignment.save
      end
    end
  end
end

# class RESO::AboveGradeFinishedAreaSourceAssignment < RESO::ParentChildAssignment
# end

# class RESO::AboveGradeFinishedAreaUnitsAssignment < RESO::ParentChildAssignment
# end

# class RESO::AccessibilityFeatureAssignment < RESO::ParentChildAssignment
# end

# class RESO::ActorTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::ApplianceAssignment < RESO::ParentChildAssignment
# end

# class RESO::AreaSourceAssignment < RESO::ParentChildAssignment
# end

# class RESO::ArchitecturalStyleAssignment < RESO::ParentChildAssignment
# end

# class RESO::AreaUnitsAssignment < RESO::ParentChildAssignment
# end

# class RESO::AssociationAmenitiesAssignment < RESO::ParentChildAssignment
# end

# class RESO::AssociationFeeIncludesAssignment < RESO::ParentChildAssignment
# end

# class RESO::AttendedAssignment < RESO::ParentChildAssignment
# end

# class RESO::BasementAssignment < RESO::ParentChildAssignment
# end

# class RESO::BelowGradeFinishedAreaSourceAssignment < RESO::ParentChildAssignment
# end

# class RESO::BelowGradeFinishedAreaUnitsAssignment < RESO::ParentChildAssignment
# end

# class RESO::BodyTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::BuildingAreaSourceAssignment < RESO::ParentChildAssignment
# end

# class RESO::BuildingFeaturesAssignment < RESO::ParentChildAssignment
# end

# class RESO::BusinessTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::BuyerAgentDesignationAssignment < RESO::ParentChildAssignment
# end

# class RESO::BuyerFinancingAssignment < RESO::ParentChildAssignment
# end

# class RESO::ChangeTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::CityAssignment < RESO::ParentChildAssignment
# end

# class RESO::ClassNameAssignment < RESO::ParentChildAssignment
# end

# class RESO::CoBuyerAgentDesignationAssignment < RESO::ParentChildAssignment
# end

# class RESO::CoListAgentDesignationAssignment < RESO::ParentChildAssignment
# end

# class RESO::CommonInterestAssignment < RESO::ParentChildAssignment
# end

# class RESO::CommonWallsAssignment < RESO::ParentChildAssignment
# end

# class RESO::CommunityFeatureAssignment < RESO::ParentChildAssignment
# end

# class RESO::CompensationTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::ConcessionsAssignment < RESO::ParentChildAssignment
# end

# class RESO::ConstructionMaterialsAssignment < RESO::ParentChildAssignment
# end

# class RESO::ContactListingPreferenceAssignment < RESO::ParentChildAssignment
# end

# class RESO::ContactStatusAssignment < RESO::ParentChildAssignment
# end

# class RESO::ContactTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::CoolingAssignment < RESO::ParentChildAssignment
# end

# class RESO::CountryAssignment < RESO::ParentChildAssignment
# end

# class RESO::CountyOrParishAssignment < RESO::ParentChildAssignment
# end

# class RESO::CurrentFinancingAssignment < RESO::ParentChildAssignment
# end

# class RESO::CurrentUseAssignment < RESO::ParentChildAssignment
# end

# class RESO::DailyScheduleAssignment < RESO::ParentChildAssignment
# end

# class RESO::DevelopmentStatusAssignment < RESO::ParentChildAssignment
# end

# class RESO::DeviceTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::DirectionFacesAssignment < RESO::ParentChildAssignment
# end

# class RESO::DoorFeaturesAssignment < RESO::ParentChildAssignment
# end

# class RESO::ElectricAssignment < RESO::ParentChildAssignment
# end

# class RESO::ElementarySchoolAssignment < RESO::ParentChildAssignment
# end

# class RESO::ElementarySchoolDistrictAssignment < RESO::ParentChildAssignment
# end

# class RESO::ElevationUnitAssignment < RESO::ParentChildAssignment
# end

# class RESO::EventTargetAssignment < RESO::ParentChildAssignment
# end

# class RESO::EventTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::ExistingLeaseTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::ExteriorFeaturesAssignment < RESO::ParentChildAssignment
# end

# class RESO::FeeFrequencyAssignment < RESO::ParentChildAssignment
# end

# class RESO::FencingAssignment < RESO::ParentChildAssignment
# end

# class RESO::FinancialDataSourceAssignment < RESO::ParentChildAssignment
# end

# class RESO::FireplaceFeatureAssignment < RESO::ParentChildAssignment
# end

# class RESO::FlooringAssignment < RESO::ParentChildAssignment
# end

# class RESO::FoundationDetailsAssignment < RESO::ParentChildAssignment
# end

# class RESO::FrontageTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::FurnishedAssignment < RESO::ParentChildAssignment
# end

# class RESO::GreenBuildingVerificationTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::GreenEnergyEfficientAssignment < RESO::ParentChildAssignment
# end

# class RESO::GreenEnergyGenerationAssignment < RESO::ParentChildAssignment
# end

# class RESO::GreenIndoorAirQualityAssignment < RESO::ParentChildAssignment
# end

# class RESO::GreenSustainabilityAssignment < RESO::ParentChildAssignment
# end

# class RESO::GreenVerificationSourceAssignment < RESO::ParentChildAssignment
# end

# class RESO::GreenVerificationStatusAssignment < RESO::ParentChildAssignment
# end

# class RESO::GreenWaterConservationAssignment < RESO::ParentChildAssignment
# end

# class RESO::HeatingAssignment < RESO::ParentChildAssignment
# end

# class RESO::HighSchoolAssignment < RESO::ParentChildAssignment
# end

# class RESO::HighSchoolDistrictAssignment < RESO::ParentChildAssignment
# end

# class RESO::HorseAmenityAssignment < RESO::ParentChildAssignment
# end

# class RESO::HoursDaysOfOperationAssignment < RESO::ParentChildAssignment
# end

# class RESO::ImageOfAssignment < RESO::ParentChildAssignment
# end

# class RESO::IncomeIncludesAssignment < RESO::ParentChildAssignment
# end

# class RESO::InteriorOrRoomFeatureAssignment < RESO::ParentChildAssignment
# end

# class RESO::LaborInformationAssignment < RESO::ParentChildAssignment
# end

# class RESO::LandLeaseAmountFrequencyAssignment < RESO::ParentChildAssignment
# end

# class RESO::LanguagesAssignment < RESO::ParentChildAssignment
# end

# class RESO::LaundryFeatureAssignment < RESO::ParentChildAssignment
# end

# class RESO::LeaseRenewalCompensationAssignment < RESO::ParentChildAssignment
# end

# class RESO::LeaseTermAssignment < RESO::ParentChildAssignment
# end

# class RESO::LevelsAssignment < RESO::ParentChildAssignment
# end

# class RESO::LinearUnitsAssignment < RESO::ParentChildAssignment
# end

# class RESO::ListAgentDesignationAssignment < RESO::ParentChildAssignment
# end

# class RESO::ListingAgreementAssignment < RESO::ParentChildAssignment
# end

# class RESO::ListingAssociationAssignment < RESO::ParentChildAssignment
# end

# class RESO::ListingServiceAssignment < RESO::ParentChildAssignment
# end

# class RESO::ListingTermsAssignment < RESO::ParentChildAssignment
# end

# class RESO::LivingAreaSourceAssignment < RESO::ParentChildAssignment
# end

# class RESO::LockBoxTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::LotDimensionsSourceAssignment < RESO::ParentChildAssignment
# end

# class RESO::LotFeatureAssignment < RESO::ParentChildAssignment
# end

# class RESO::LotSizeSourceAssignment < RESO::ParentChildAssignment
# end

# class RESO::LotSizeUnitAssignment < RESO::ParentChildAssignment
# end

# class RESO::MediaCategoryAssignment < RESO::ParentChildAssignment
# end

# class RESO::MediaTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::MemberDesignationAssignment < RESO::ParentChildAssignment
# end

# class RESO::MemberOtherPhoneTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::MemberStatusAssignment < RESO::ParentChildAssignment
# end

# class RESO::MemberTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::MiddleOrJuniorSchoolAssignment < RESO::ParentChildAssignment
# end

# class RESO::MiddleOrJuniorSchoolDistrictAssignment < RESO::ParentChildAssignment
# end

# class RESO::MlsAreaMajorAssignment < RESO::ParentChildAssignment
# end

# class RESO::MlsAreaMinorAssignment < RESO::ParentChildAssignment
# end

# class RESO::MlsStatusAssignment < RESO::ParentChildAssignment
# end

# class RESO::MobileDimUnitsAssignment < RESO::ParentChildAssignment
# end

# class RESO::NotedByAssignment < RESO::ParentChildAssignment
# end

# class RESO::ObjectIdTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::ObjectTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::OccupantTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::OfficeBranchTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::OfficeStatusAssignment < RESO::ParentChildAssignment
# end

# class RESO::OfficeTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::OpenHouseStatusAssignment < RESO::ParentChildAssignment
# end

# class RESO::OpenHouseTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::OperatingExpenseIncludesAssignment < RESO::ParentChildAssignment
# end

# class RESO::OtherEquipmentAssignment < RESO::ParentChildAssignment
# end

# class RESO::OtherPhoneTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::OtherStructuresAssignment < RESO::ParentChildAssignment
# end

# class RESO::OwnerPaysAssignment < RESO::ParentChildAssignment
# end

# class RESO::OwnershipTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::ParkingFeatureAssignment < RESO::ParentChildAssignment
# end

# class RESO::PatioAndPorchFeaturesAssignment < RESO::ParentChildAssignment
# end

# class RESO::PermissionAssignment < RESO::ParentChildAssignment
# end

# class RESO::PetsAllowedAssignment < RESO::ParentChildAssignment
# end

# class RESO::PoolFeatureAssignment < RESO::ParentChildAssignment
# end

# class RESO::PossessionAssignment < RESO::ParentChildAssignment
# end

# class RESO::PossibleUseAssignment < RESO::ParentChildAssignment
# end

# class RESO::PostalCityAssignment < RESO::ParentChildAssignment
# end

# class RESO::PowerProductionAnnualStatusAssignment < RESO::ParentChildAssignment
# end

# class RESO::PowerProductionTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::PreferredAddressAssignment < RESO::ParentChildAssignment
# end

# class RESO::PreferredPhoneAssignment < RESO::ParentChildAssignment
# end

# class RESO::PropertyConditionAssignment < RESO::ParentChildAssignment
# end

# class RESO::PropertySubTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::PropertyTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::QueueTransactionTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::ReasonActiveOrDisabledAssignment < RESO::ParentChildAssignment
# end

# class RESO::RentIncludesAssignment < RESO::ParentChildAssignment
# end

# class RESO::ResourceNameAssignment < RESO::ParentChildAssignment
# end

# class RESO::RoadFrontageTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::RoadResponsibilityAssignment < RESO::ParentChildAssignment
# end

# class RESO::RoadSurfaceTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::RoofAssignment < RESO::ParentChildAssignment
# end

# class RESO::RoomTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::RuleFormatAssignment < RESO::ParentChildAssignment
# end

# class RESO::ScheduleTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::SearchQueryTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::SecurityFeatureAssignment < RESO::ParentChildAssignment
# end

# class RESO::SewerAssignment < RESO::ParentChildAssignment
# end

# class RESO::ShowingContactTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::ShowingRequirementsAssignment < RESO::ParentChildAssignment
# end

# class RESO::SkirtAssignment < RESO::ParentChildAssignment
# end

# class RESO::SocialMediaTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::SpaFeatureAssignment < RESO::ParentChildAssignment
# end

# class RESO::SpecialLicensesAssignment < RESO::ParentChildAssignment
# end

# class RESO::SpecialListingConditionsAssignment < RESO::ParentChildAssignment
# end

# class RESO::StandardStatusAssignment < RESO::ParentChildAssignment
# end

# class RESO::StateOrProvinceAssignment < RESO::ParentChildAssignment
# end

# class RESO::StreetDirPrefixAssignment < RESO::ParentChildAssignment
# end

# class RESO::StreetDirSuffixAssignment < RESO::ParentChildAssignment
# end

# class RESO::StreetDirectionAssignment < RESO::ParentChildAssignment
# end

# class RESO::StreetSuffixAssignment < RESO::ParentChildAssignment
# end

# class RESO::StructureTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::SyndicateToAssignment < RESO::ParentChildAssignment
# end

# class RESO::TaxStatusCurrentAssignment < RESO::ParentChildAssignment
# end

# class RESO::TeamMemberTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::TeamStatusAssignment < RESO::ParentChildAssignment
# end

# class RESO::TenantPaysAssignment < RESO::ParentChildAssignment
# end

# class RESO::UnitsFurnishedAssignment < RESO::ParentChildAssignment
# end

# class RESO::UnitTypeTypeAssignment < RESO::ParentChildAssignment
# end

# class RESO::UtilitiesAssignment < RESO::ParentChildAssignment
# end

# class RESO::VegetationAssignment < RESO::ParentChildAssignment
# end

# class RESO::ViewAssignment < RESO::ParentChildAssignment
# end

# class RESO::WaterfrontFeatureAssignment < RESO::ParentChildAssignment
# end

# class RESO::WaterSourceAssignment < RESO::ParentChildAssignment
# end

# class RESO::WindowFeaturesAssignment < RESO::ParentChildAssignment
# end

# class RESO::YearBuiltSourceAssignment < RESO::ParentChildAssignment
# end

