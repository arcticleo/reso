class RESO::Property < ApplicationRecord
  
  has_one :characteristics, dependent: :destroy
  has_one :equipment, dependent: :destroy
  has_one :farming, dependent: :destroy
  has_one :financial, dependent: :destroy
  has_one :listing, dependent: :destroy
  has_one :location, dependent: :destroy
  has_one :occupant_owner, dependent: :destroy
  has_one :structure, dependent: :destroy

  has_one :reso_property_type_assignment, as: :parent, class_name: "PropertyTypeAssignment", dependent: :destroy
  has_one :property_type,
    through: :reso_property_type_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  has_one :reso_property_sub_type_assignment, as: :parent, class_name: "PropertySubTypeAssignment", dependent: :destroy
  has_one :property_sub_type,
    through: :reso_property_sub_type_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  after_save :import_property

  def import_property
    ImportPropertyJob.perform_later(self)
  end

  def import_property_steps
    import_property_characteristics
    import_property_equipment
    import_property_farming
    import_property_financial
    import_property_listing
    import_property_listing_price
    import_property_listing_remarks
    import_property_location_address
    import_property_location_area
    import_property_location_gis
    import_property_location_school
    import_property_occupant_owner
    import_property_structure
  end

  def import_property_characteristics
    characteristics_attributes = {
      anchors_co_tenants: self.input["AnchorsCoTenants"],
      community_features: self.input["CommunityFeatures"],
      current_use: self.input["CurrentUse"],
      development_status: self.input["DevelopmentStatus"],
      fencing: self.input["Fencing"],
      frontage_length: self.input["FrontageLength"],
      frontage_type: self.input["FrontageType"],
      furnished: self.input["Furnished"],
      horse_amenities: self.input["HorseAmenities"],
      horse_yn: self.input["HorseYN"],
      land_lease_amount: self.input["LandLeaseAmount"],
      land_lease_amount_frequency: self.input["LandLeaseAmountFrequency"],
      land_lease_expiration_date: self.input["LandLeaseExpirationDate"],
      land_lease_yn: self.input["LandLeaseYN"],
      laundry_features: self.input["LaundryFeatures"],
      lease_term: self.input["LeaseTerm"],
      lot_dimensions_source: self.input["LotDimensionsSource"],
      lot_features: self.input["LotFeatures"],
      lot_size_acres: self.input["LotSizeAcres"],
      lot_size_area: self.input["LotSizeArea"],
      lot_size_dimensions: self.input["LotSizeDimensions"],
      lot_size_source: self.input["LotSizeSource"],
      lot_size_square_feet: self.input["LotSizeSquareFeet"],
      lot_size_units: self.input["LotSizeUnits"],
      mobile_home_remains_yn: self.input["MobileHomeRemainsYN"],
      number_of_buildings: self.input["NumberOfBuildings"],
      number_of_lots: self.input["NumberOfLots"],
      number_of_pads: self.input["NumberOfPads"],
      number_of_units_in_community: self.input["NumberOfUnitsInCommunity"],
      number_of_units_total: self.input["NumberOfUnitsTotal"],
      park_manager_name: self.input["ParkManagerName"],
      park_manager_phone: self.input["ParkManagerPhone"],
      park_name: self.input["ParkName"],
      pool_features: self.input["PoolFeatures"],
      pool_private_yn: self.input["PoolPrivateYN"],
      possible_use: self.input["PossibleUse"],
      road_frontage_type: self.input["RoadFrontageType"],
      road_responsibility: self.input["RoadResponsibility"],
      road_surface_type: self.input["RoadSurfaceType"],
      senior_community_yn: self.input["SeniorCommunityYN"],
      spa_features: self.input["SpaFeatures"],
      spa_yn: self.input["SpaYN"],
      topography: self.input["Topography"],
      units_furnished: self.input["UnitsFurnished"],
      view: self.input["View"],
      view_yn: self.input["ViewYN"],
      water_body_name: self.input["WaterBodyName"],
      waterfront_features: self.input["WaterfrontFeatures"],
      waterfront_yn: self.input["WaterfrontYN"]
    }.compact

    unless characteristics_attributes.keys.count.zero?
      self.characteristics = RESO::Property::Characteristics.new if self.characteristics.blank?
      self.characteristics.update(characteristics_attributes)
    end
  end
  
  def import_property_equipment
    equipment_attributes = {
      appliances: self.input["Appliances"],
      other_equipment: self.input["OtherEquipment"],
      security_features: self.input["SecurityFeatures"]
    }.compact

    unless equipment_attributes.keys.count.zero?
      self.equipment = RESO::Property::Equipment.new if self.equipment.blank?
      self.equipment.update(equipment_attributes)
    end
  end

  def import_property_farming
    farming_attributes = {
      crops_included_yn: self.input["CropsIncludedYN"],
      cultivated_area: self.input["CultivatedArea"],
      farm_credit_service_incl_yn: self.input["FarmCreditServiceInclYN"],
      farm_land_area_source: self.input["FarmLandAreaSource"],
      farm_land_area_units: self.input["FarmLandAreaUnits"],
      grazing_permits_blm_yn: self.input["GrazingPermitsBlmYN"],
      grazing_permits_forest_service_yn: self.input["GrazingPermitsForestServiceYN"],
      grazing_permits_private_yn: self.input["GrazingPermitsPrivateYN"],
      pasture_area: self.input["PastureArea"],
      range_area: self.input["RangeArea"],
      vegetation: self.input["Vegetation"],
      wooded_area: self.input["WoodedArea"]
    }.compact

    unless farming_attributes.keys.count.zero?
      self.farming = RESO::Property::Farming.new if self.farming.blank?
      self.farming.update(farming_attributes)
    end
  end

  def import_property_financial
    financial_attributes = {
      cable_tv_expense: self.input["CableTvExpense"],
      cap_rate: self.input["CapRate"],
      electric_expense: self.input["ElectricExpense"],
      existing_lease_type: self.input["ExistingLeaseType"],
      financial_data_source: self.input["FinancialDataSource"],
      fuel_expense: self.input["FuelExpense"],
      furniture_replacement_expense: self.input["FurnitureReplacementExpense"],
      gardener_expense: self.input["GardenerExpense"],
      gross_income: self.input["GrossIncome"],
      gross_scheduled_income: self.input["GrossScheduledIncome"],
      income_includes: self.input["IncomeIncludes"],
      insurance_expense: self.input["InsuranceExpense"],
      licenses_expense: self.input["LicensesExpense"],
      maintenance_expense: self.input["MaintenanceExpense"],
      manager_expense: self.input["ManagerExpense"],
      net_operating_income: self.input["NetOperatingIncome"],
      new_taxes_expense: self.input["NewTaxesExpense"],
      number_of_units_leased: self.input["NumberOfUnitsLeased"],
      number_of_units_mo_mo: self.input["NumberOfUnitsMoMo"],
      number_of_units_vacant: self.input["NumberOfUnitsVacant"],
      operating_expense: self.input["OperatingExpense"],
      operating_expense_includes: self.input["OperatingExpenseIncludes"],
      other_expense: self.input["OtherExpense"],
      owner_pays: self.input["OwnerPays"],
      pest_control_expense: self.input["PestControlExpense"],
      pool_expense: self.input["PoolExpense"],
      professional_management_expense: self.input["ProfessionalManagementExpense"],
      rent_control_yn: self.input["RentControlYN"],
      rent_includes: self.input["RentIncludes"],
      supplies_expense: self.input["SuppliesExpense"],
      tenant_pays: self.input["TenantPays"],
      total_actual_rent: self.input["TotalActualRent"],
      trash_expense: self.input["TrashExpense"],
      vacancy_allowance: self.input["VacancyAllowance"],
      vacancy_allowance_rate: self.input["VacancyAllowanceRate"],
      water_sewer_expense: self.input["WaterSewerExpense"]
    }
    financial_attributes = financial_attributes.each{|key, value| financial_attributes[key] = value.presence}.compact

    unless financial_attributes.keys.count.zero?
      self.financial = RESO::Property::Financial.new if self.financial.blank?
      self.financial.update(financial_attributes)
    end
  end

  def import_property_listing
    listing_attributes = {
      copyright_notice:  self.input["CopyrightNotice"],
      disclaimer:  self.input["Disclaimer"],
      home_warranty_yn:  self.input["HomeWarrantyYN"],
      lease_considered_yn:  self.input["LeaseConsideredYN"],
      listing_association:  self.input["ListAOR"],
      listing_agreement:  self.input["ListingAgreement"],
      listing_id:  self.input["ListingId"],
      listing_key:  self.input["ListingKey"],
      listing_key_numeric:  self.input["ListingKeyNumeric"],
      listing_service:  self.input["ListingService"],
      mls_status:  self.input["MlsStatus"],
      originating_system_id:  self.input["OriginatingSystemID"],
      originating_system_key:  self.input["OriginatingSystemKey"],
      originating_system_name:  self.input["OriginatingSystemName"],
      source_system_id:  self.input["SourceSystemID"],
      source_system_key:  self.input["SourceSystemKey"],
      source_system_name:  self.input["SourceSystemName"],
      standard_status:  self.input["StandardStatus"]
    }.compact

    unless listing_attributes.keys.count.zero?
      self.listing = RESO::Property::Listing.new if self.listing.blank?
      self.listing.update(listing_attributes)
    end
  end

  def import_property_listing_price
    price_attributes = {
      close_price: self.input["ClosePrice"],
      list_price: self.input["ListPrice"],
      list_price_low: self.input["ListPriceLow"],
      original_list_price: self.input["OriginalListPrice"],
      previous_list_price: self.input["PreviousListPrice"]
    }.compact

    unless price_attributes.keys.count.zero?
      self.listing = RESO::Property::Listing.new if self.listing.blank?
      self.listing.price = RESO::Property::Listing::Price.new if self.listing.price.blank?      
      self.listing.price.update(price_attributes)
    end
  end

  def import_property_listing_remarks
    remarks_attributes = {
      private_office_remarks: self.input["PrivateOfficeRemarks"],
      private_remarks: self.input["PrivateRemarks"],
      public_remarks: self.input["PublicRemarks"],
      syndication_remarks: self.input["SyndicationRemarks"]
    }.compact

    unless remarks_attributes.keys.count.zero?
      self.listing = RESO::Property::Listing.new if self.listing.blank?
      self.listing.remarks = RESO::Property::Listing::Remarks.new if self.listing.remarks.blank?
      self.listing.remarks.update(remarks_attributes)
    end
  end

  def import_property_listing_showing
    showing_attributes = {
      access_code: self.input["AccessCode"],
      lock_box_location: self.input["LockBoxLocation"],
      lock_box_serial_number: self.input["LockBoxSerialNumber"],
    lock_box_type: self.input["LockBoxType"],
      showing_advance_notice: self.input["ShowingAdvanceNotice"],
      showing_attended_yn: self.input["ShowingAttendedYN"],
      showing_contact_name: self.input["ShowingContactName"],
      showing_contact_phone_ext: self.input["ShowingContactPhoneExt"],
      showing_contact_phone: self.input["ShowingContactPhone"],
    showing_contact_type: self.input["ShowingContactType"],
    showing_days: self.input["ShowingDays"],
      showing_end_time: self.input["ShowingEndTime"],
      showing_instructions: self.input["ShowingInstructions"],
    showing_requirements: self.input["ShowingRequirements"],
      showing_start_time: self.input["ShowingStartTime"]
    }
    showing_attributes = showing_attributes.each{|key, value| showing_attributes[key] = value.presence}.compact
    
    unless showing_attributes.keys.count.zero?
      self.listing = RESO::Property::Listing.new if self.listing.blank?
      self.listing.showing = RESO::Property::Listing::Showing.new if self.listing.showing.blank?
      self.listing.showing.update(showing_attributes)
    end
  end

  def import_property_location_address
    address_attributes = {
      carrier_route: self.input["CarrierRoute"],
      city: self.input["City"],
      country: self.input["Country"],
      county_or_parish: self.input["CountyOrParish"],
      postal_city: self.input["PostalCity"],
      postal_code: self.input["PostalCode"],
      postal_code_plus4: self.input["PostalCodePlus4"],
      state_or_province: self.input["StateOrProvince"],
      street_additional_info: self.input["StreetAdditionalInfo"],
      street_dir_prefix: self.input["StreetDirPrefix"],
      street_dir_suffix: self.input["StreetDirSuffix"],
      street_name: self.input["StreetName"],
      street_number: self.input["StreetNumber"],
      street_number_numeric: self.input["StreetNumberNumeric"],
      street_suffix: self.input["StreetSuffix"],
      street_suffix_modifier: self.input["StreetSuffixModifier"],
      township: self.input["Township"],
      unit_number: self.input["UnitNumber"],
      unparsed_address: self.input["UnparsedAddress"]
    }.compact

    unless address_attributes.keys.count.zero?
      self.location = RESO::Property::Location.new if self.location.blank?
      self.location.address = RESO::Property::Location::Address.new if self.location.address.blank?
      self.location.address.update(address_attributes)
    end
  end

  def import_property_location_area
    area_attributes = {
      city_region: self.input["CityRegion"],
      continent_region: self.input["ContinentRegion"],
      country_region: self.input["CountryRegion"],
      mls_area_major: self.input["MLSAreaMajor"],
      mls_area_minor: self.input["MLSAreaMinor"],
      state_region: self.input["StateRegion"],
      subdivision_name: self.input["SubdivisionName"]
    }.compact

    unless area_attributes.keys.count.zero?
      self.location = RESO::Property::Location.new if self.location.blank?
      self.location.area = RESO::Property::Location::Area.new if self.location.area.blank?
      self.location.area.update(area_attributes)
    end
  end

  def import_property_location_gis
    gis_attributes = {
      cross_street: self.input["CrossStreet"],
      directions: self.input["Directions"],
      elevation: self.input["Elevation"],
      elevation_units: self.input["ElevationUnits"],
      latitude: self.input["Latitude"],
      longitude: self.input["Longitude"],
      map_coordinate: self.input["MapCoordinate"],
      map_coordinate_source: self.input["MapCoordinateSource"],
      map_url: self.input["MapURL"]
    }.compact
    
    unless gis_attributes.keys.count.zero?
      self.location = RESO::Property::Location.new if self.location.blank?
      self.location.gis = RESO::Property::Location::GIS.new if self.location.gis.blank?
      self.location.gis.update(gis_attributes)
    end
  end

  def import_property_location_school
    school_attributes = {
      elementary_school_district: self.input["ElementarySchoolDistrict"],
      elementary_school: self.input["ElementarySchool"],
      high_school_district: self.input["HighSchoolDistrict"],
      high_school: self.input["HighSchool"],
      middle_or_junior_school_district: self.input["MiddleOrJuniorSchoolDistrict"],
      middle_or_junior_school: self.input["MiddleOrJuniorSchool"]
    }.compact
    
    unless school_attributes.keys.count.zero?
      self.location = RESO::Property::Location.new if self.location.blank?
      self.location.school = RESO::Property::Location::School.new if self.location.school.blank?
      self.location.school.update(school_attributes)
    end
  end

  def import_property_occupant_owner
    occupant_owner_attributes = {
      occupant_name: self.input["OccupantName"],
      occupant_phone: self.input["OccupantPhone"],
      occupant_type: self.input["OccupantType"],
      owner_name: self.input["OwnerName"],
      owner_phone: self.input["OwnerPhone"]
    }.compact

    unless occupant_owner_attributes.keys.count.zero?
      self.occupant_owner = RESO::Property::OccupantOwner.new if self.occupant_owner.blank?
      self.occupant_owner.update(occupant_owner_attributes)
    end
  end

  def import_property_structure
    structure_attributes = {
      above_grade_finished_area: self.input["AboveGradeFinishedArea"],
      above_grade_finished_area_source: self.input["AboveGradeFinishedAreaSource"],
      above_grade_finished_area_units: self.input["AboveGradeFinishedAreaUnits"],
      accessibility_features: self.input["AccessibilityFeatures"],
      architectural_style: self.input["ArchitecturalStyle"],
      attached_garage_yn: self.input["AttachedGarageYN"],
      basement: self.input["Basement"],
      basement_yn: self.input["BasementYN"],
      bathrooms_full: self.input["BathroomsFull"],
      bathrooms_half: self.input["BathroomsHalf"],
      bathrooms_one_quarter: self.input["BathroomsOneQuarter"],
      bathrooms_partial: self.input["BathroomsPartial"],
      bathrooms_three_quarter: self.input["BathroomsThreeQuarter"],
      bathrooms_total_integer: self.input["BathroomsTotalInteger"],
      bedrooms_possible: self.input["BedroomsPossible"],
      bedrooms_total: self.input["BedroomsTotal"],
      below_grade_finished_area: self.input["BelowGradeFinishedArea"],
      below_grade_finished_area_source: self.input["BelowGradeFinishedAreaSource"],
      below_grade_finished_area_units: self.input["BelowGradeFinishedAreaUnits"],
      body_type: self.input["BodyType"],
      builder_model: self.input["BuilderModel"],
      builder_name: self.input["BuilderName"],
      building_area_source: self.input["BuildingAreaSource"],
      building_area_total: self.input["BuildingAreaTotal"],
      building_area_units: self.input["BuildingAreaUnits"],
      building_features: self.input["BuildingFeatures"],
      building_name: self.input["BuildingName"],
      carport_spaces: self.input["CarportSpaces"],
      carport_yn: self.input["CarportYN"],
      common_walls: self.input["CommonWalls"],
      construction_materials: self.input["ConstructionMaterials"],
      cooling: self.input["Cooling"],
      cooling_yn: self.input["CoolingYN"],
      covered_spaces: self.input["CoveredSpaces"],
      direction_faces: self.input["DirectionFaces"],
      doh_1: self.input["DOH1"],
      doh_2: self.input["DOH2"],
      doh_3: self.input["DOH3"],
      door_features: self.input["DoorFeatures"],
      entry_level: self.input["EntryLevel"],
      entry_location: self.input["EntryLocation"],
      exterior_features: self.input["ExteriorFeatures"],
      fireplace_features: self.input["FireplaceFeatures"],
      fireplaces_total: self.input["FireplacesTotal"],
      fireplace_yn: self.input["FireplaceYN"],
      flooring: self.input["Flooring"],
      foundation_area: self.input["FoundationArea"],
      foundation_details: self.input["FoundationDetails"],
      garage_spaces: self.input["GarageSpaces"],
      garage_yn: self.input["GarageYN"],
      habitable_residence_yn: self.input["HabitableResidenceYN"],
      heating: self.input["Heating"],
      heating_yn: self.input["HeatingYN"],
      interior_features: self.input["InteriorFeatures"],
      leasable_area: self.input["LeasableArea"],
      leasable_area_units: self.input["LeasableAreaUnits"],
      levels: self.input["Levels"],
      license_1: self.input["License1"],
      license_2: self.input["License2"],
      license_3: self.input["License3"],
      living_area: self.input["LivingArea"],
      living_area_source: self.input["LivingAreaSource"],
      living_area_units: self.input["LivingAreaUnits"],
      main_level_bathrooms: self.input["MainLevelBathrooms"],
      main_level_bedrooms: self.input["MainLevelBedrooms"],
      make: self.input["Make"],
      mobile_dim_units: self.input["MobileDimUnits"],
      mobile_length: self.input["MobileLength"],
      mobile_width: self.input["MobileWidth"],
      model: self.input["Model"],
      new_construction_yn: self.input["NewConstructionYN"],
      open_parking_spaces: self.input["OpenParkingSpaces"],
      open_parking_yn: self.input["OpenParkingYN"],
      other_parking: self.input["OtherParking"],
      other_structures: self.input["OtherStructures"],
      parking_features: self.input["ParkingFeatures"],
      parking_total: self.input["ParkingTotal"],
      patio_and_porch_features: self.input["PatioAndPorchFeatures"],
      property_attached_yn: self.input["PropertyAttachedYN"],
      property_condition: self.input["PropertyCondition"],
      roof: self.input["Roof"],
      rv_parking_dimensions: self.input["RVParkingDimensions"],
      serial_u: self.input["SerialU"],
      serial_x: self.input["SerialX"],
      serial_xx: self.input["SerialXX"],
      skirt: self.input["Skirt"],
      stories: self.input["Stories"],
      stories_total: self.input["StoriesTotal"],
      structure_type: self.input["StructureType"],
      window_features: self.input["WindowFeatures"],
      year_built_details: self.input["YearBuiltDetails"],
      year_built_effective: self.input["YearBuiltEffective"],
      year_built: self.input["YearBuilt"],
      year_built_source: self.input["YearBuiltSource"]
    }.compact
    
    unless structure_attributes.keys.count.zero?
      self.structure = RESO::Property::Structure.new if self.structure.blank?
      self.structure.update(structure_attributes)
    end
  end
end























