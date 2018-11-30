ActiveRecord::Schema.define do
  self.verbose = false

  create_table :reso_enumerations, :force => true do |t|
    t.string :name
    t.string :type
    t.timestamps
  end

  create_table :enumeration_assignments do |t|
    t.string :type
    t.references :enumerable, polymorphic: true, index: false
    t.references :enumeration, index: true
    t.timestamps
  end
  add_index :enumeration_assignments, :type
  add_index :enumeration_assignments,
    [:enumerable_type, :enumerable_id],
    {name: "index_on_enumerable_type_and_id"}

  create_table :reso_properties, :force => true do |t|
#    t.text :property_sub_type, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :property_type, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :property_universal_id, limit: 128
    t.timestamps
  end

  create_table :reso_property_equipment, :force => true do |t|
    t.integer :property_id
    t.text :appliances, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :other_equipment, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :security_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.timestamps
  end

  create_table :reso_property_businesses, :force => true do |t|
    t.integer :property_id
    t.string :business_name, limit: 255
    t.text :business_type, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :hours_days_of_operation, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.string :hours_days_of_operation_description, limit: 255
    t.text :labor_information, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :lease_amount, limit: 14, precision: 2
    t.text :lease_amount_frequency, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.boolean :lease_assignable_yn
    t.date :lease_expiration
    t.boolean :lease_renewal_option_yn
    t.string :number_of_full_time_employees, limit: 10 # TODO: validates :number_of_full_time_employees, format: { with: /A[0-9]+z/ }
    t.string :number_of_part_time_employees, limit: 10 # TODO: validates :number_of_part_time_employees, format: { with: /A[0-9]+z/ }
    t.text :ownership_type, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :seating_capacity, limit: 10 # TODO: validates :seating_capacity, format: { with: /A[0-9]+z/ }
    t.text :special_licenses, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.integer :year_established # TODO: verify length of .to_s to max 4
    t.integer :years_current_owner # TODO: verify length of .to_s to max 4
    t.timestamps
  end

  create_table :reso_property_characteristics, :force => true do |t|
    t.integer :property_id
    t.text :anchors_co_tenants
    t.text :community_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :current_use, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :development_status, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :fencing, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.string :frontage_length, limit: 255
    t.text :frontage_type, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :furnished, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :horse_amenities, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.boolean :horse_yn
    t.decimal :land_lease_amount, limit: 14, precision: 2
    t.text :land_lease_amount_frequency, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.date :land_lease_expiration_date
    t.boolean :land_lease_yn
    t.string :laundry_features
    t.text :lease_term, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :lot_dimensions_source, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :lot_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :lot_size_acres, limit: 16, precision: 4
    t.decimal :lot_size_area, limit: 16, precision: 4
    t.string :lot_size_dimensions, limit: 150
    t.text :lot_size_source, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.decimal :lot_size_square_feet, limit: 14, precision: 2
    t.text :lot_size_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.boolean :mobile_home_remains_yn
    t.integer :number_of_buildings # TODO: verify length of .to_s to max 3
    t.integer :number_of_lots # TODO: verify length of .to_s to max 3
    t.integer :number_of_pads # TODO: verify length of .to_s to max 3
    t.integer :number_of_units_in_community # TODO: verify length of .to_s to max 5
    t.integer :number_of_units_total # TODO: verify length of .to_s to max 3
    t.string :park_manager_name, limit: 50
    t.string :park_manager_phone, limit: 16
    t.string :park_name, limit: 50
    t.text :pool_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.boolean :pool_private_yn
    t.text :possible_use, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :road_frontage_type, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :road_responsibility, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :road_surface_type, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.boolean :senior_community_yn
    t.text :spa_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.boolean :spa_yn
    t.string :topography, limit: 255
    t.text :units_furnished, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :view, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.boolean :view_yn
    t.string :water_body_name, limit: 50
    t.text :waterfront_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.boolean :waterfront_yn
    t.timestamps
  end

  create_table :reso_property_farmings, :force => true do |t|
    t.integer :property_id
    t.boolean :crops_included_yn
    t.decimal :cultivated_area, limit: 14, precision: 2
    t.boolean :farm_credit_service_incl_yn
    t.text :farm_land_area_source, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :farm_land_area_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.boolean :grazing_permits_blm_yn
    t.boolean :grazing_permits_forest_service_yn
    t.boolean :grazing_permits_private_yn
    t.decimal :pasture_area, limit: 14, precision: 2
    t.decimal :range_area, limit: 14, precision: 2
#    t.text :vegetation, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :wooded_area, limit: 14, precision: 2
    t.timestamps
  end

  create_table :reso_property_financials, :force => true do |t|
    t.integer :property_id
    t.decimal :cable_tv_expense, limit: 14, precision: 2
    t.decimal :cap_rate, limit: 5, precision: 2
    t.decimal :electric_expense, limit: 14, precision: 2
    t.text :existing_lease_type, limit: 75 # TODO: DELETE - String List, Multi - has_many :through
    t.text :financial_data_source, limit: 75 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :fuel_expense, limit: 14, precision: 2
    t.decimal :furniture_replacement_expense, limit: 14, precision: 2
    t.decimal :gardener_expense, limit: 14, precision: 2
    t.decimal :gross_income, limit: 14, precision: 2
    t.decimal :gross_scheduled_income, limit: 14, precision: 2
    t.text :income_includes, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :insurance_expense, limit: 14, precision: 2
    t.decimal :licenses_expense, limit: 14, precision: 2
    t.decimal :maintenance_expense, limit: 14, precision: 2
    t.decimal :manager_expense, limit: 14, precision: 2
    t.decimal :net_operating_income, limit: 14, precision: 2
    t.decimal :new_taxes_expense, limit: 14, precision: 2
    t.integer :number_of_units_leased # TODO: verify length of .to_s to max 5
    t.integer :number_of_units_mo_mo # TODO: verify length of .to_s to max 5
    t.integer :number_of_units_vacant # TODO: verify length of .to_s to max 5
    t.decimal :operating_expense, limit: 14, precision: 2
    t.text :operating_expense_includes, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :other_expense, limit: 14, precision: 2
    t.text :owner_pays, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :pest_control_expense, limit: 14, precision: 2
    t.decimal :pool_expense, limit: 14, precision: 2
    t.decimal :professional_management_expense, limit: 14, precision: 2
    t.boolean :rent_control_yn
    t.text :rent_includes, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :supplies_expense, limit: 14, precision: 2
    t.text :tenant_pays, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :total_actual_rent, limit: 14, precision: 2
    t.decimal :trash_expense, limit: 14, precision: 2
    t.string :vacancy_allowance, limit: 9 # TODO: validates :vacancy_allowance, format: { with: /A[0-9]+z/ }
    t.decimal :vacancy_allowance_rate, limit: 5, precision: 2
    t.decimal :water_sewer_expense, limit: 14, precision: 2
    t.decimal :workmans_compensation_expense, limit: 14, precision: 2
    t.timestamps
  end

  create_table :reso_property_hoas, :force => true do |t|
    t.integer :property_id
    t.text :association_amenities, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :association_fee, limit: 14, precision: 2
    t.decimal :association_fee2, limit: 14, precision: 2
    t.text :association_fee2_frequency, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :association_fee_frequency, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :association_fee_includes, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.string :association_name, limit: 50
    t.string :association_name2, limit: 50
    t.string :association_phone, limit: 16
    t.string :association_phone2, limit: 16
    t.boolean :association_yn
    t.text :pets_allowed, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.timestamps
  end

  create_table :reso_property_listings, :force => true do |t|
    t.integer :property_id
    t.text :copyright_notice
    t.text :disclaimer
    t.boolean :home_warranty_yn
    t.boolean :lease_considered_yn
    t.text :list_aor, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :listing_agreement, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :listing_id, limit: 255
    t.string :listing_key, limit: 255
    t.string :listing_key_numeric, limit: 255 # TODO: validates :listing_key_numeric, format: { with: /A[0-9]+z/ }
    t.text :listing_service, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :mls_status, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :originating_system_id, limit: 25
    t.string :originating_system_key, limit: 255
    t.string :originating_system_name, limit: 255
    t.string :source_system_id, limit: 25
    t.string :source_system_key, limit: 255
    t.string :source_system_name, limit: 255
    t.text :standard_status, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.timestamps
  end

  create_table :reso_property_listing_agent_offices, :force => true do |t|
    t.integer :listing_id
    t.timestamps
  end

  create_table :reso_property_listing_agent_office_buyer_agents, :force => true do |t|
    t.integer :agent_office_id
    t.text :buyer_agent_aor, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :buyer_agent_designation, limit: 50 # TODO: DELETE - String List, Multi - has_many :through
    t.string :buyer_agent_direct_phone, limit: 16
    t.string :buyer_agent_email, limit: 80
    t.string :buyer_agent_fax, limit: 16
    t.string :buyer_agent_first_name, limit: 50
    t.string :buyer_agent_full_name, limit: 150
    t.string :buyer_agent_home_phone, limit: 16
    t.string :buyer_agent_key, limit: 255
    t.string :buyer_agent_key_numeric, limit: 255 # TODO: validates :buyer_agent_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :buyer_agent_last_name, limit: 50
    t.string :buyer_agent_middle_name, limit: 50
    t.string :buyer_agent_mls_id, limit: 25
    t.string :buyer_agent_mobile_phone, limit: 16
    t.string :buyer_agent_name_prefix, limit: 10
    t.string :buyer_agent_name_suffix, limit: 10
    t.string :buyer_agent_office_phone, limit: 16
    t.string :buyer_agent_office_phone_ext, limit: 10
    t.string :buyer_agent_pager, limit: 16
    t.string :buyer_agent_preferred_phone, limit: 16
    t.string :buyer_agent_preferred_phone_ext, limit: 10
    t.string :buyer_agent_state_license, limit: 50
    t.string :buyer_agent_toll_free_phone, limit: 16
    t.text :buyer_agent_url
    t.string :buyer_agent_voice_mail, limit: 16
    t.string :buyer_agent_voice_mail_ext, limit: 10
    t.timestamps
  end

  create_table :reso_property_listing_agent_office_buyer_offices, :force => true do |t|
    t.integer :agent_office_id
    t.text :buyer_office_aor, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :buyer_office_email, limit: 80
    t.string :buyer_office_fax, limit: 16
    t.string :buyer_office_key, limit: 255
    t.string :buyer_office_key_numeric, limit: 255 # TODO: validates :buyer_office_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :buyer_office_mls_id, limit: 25
    t.string :buyer_office_name, limit: 255
    t.string :buyer_office_phone, limit: 16
    t.string :buyer_office_phone_ext, limit: 10
    t.text :buyer_office_url
    t.timestamps
  end

  create_table :reso_property_listing_agent_office_co_buyer_agents, :force => true do |t|
    t.integer :agent_office_id
    t.text :co_buyer_agent_aor, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :co_buyer_agent_designation, limit: 50 # TODO: DELETE - String List, Multi - has_many :through
    t.string :co_buyer_agent_direct_phone, limit: 16
    t.string :co_buyer_agent_email, limit: 80
    t.string :co_buyer_agent_fax, limit: 16
    t.string :co_buyer_agent_first_name, limit: 50
    t.string :co_buyer_agent_full_name, limit: 150
    t.string :co_buyer_agent_home_phone, limit: 16
    t.string :co_buyer_agent_key, limit: 255
    t.string :co_buyer_agent_key_numeric, limit: 255 # TODO: validates :co_buyer_agent_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :co_buyer_agent_last_name, limit: 50
    t.string :co_buyer_agent_middle_name, limit: 50
    t.string :co_buyer_agent_mls_id, limit: 25
    t.string :co_buyer_agent_mobile_phone, limit: 16
    t.string :co_buyer_agent_name_prefix, limit: 10
    t.string :co_buyer_agent_name_suffix, limit: 10
    t.string :co_buyer_agent_office_phone, limit: 16
    t.string :co_buyer_agent_office_phone_ext, limit: 10
    t.string :co_buyer_agent_pager, limit: 16
    t.string :co_buyer_agent_preferred_phone, limit: 16
    t.string :co_buyer_agent_preferred_phone_ext, limit: 10
    t.string :co_buyer_agent_state_license, limit: 50
    t.string :co_buyer_agent_toll_free_phone, limit: 16
    t.text :co_buyer_agent_url
    t.string :co_buyer_agent_voice_mail, limit: 16
    t.string :co_buyer_agent_voice_mail_ext, limit: 10
    t.timestamps
  end

  create_table :reso_property_listing_agent_office_co_buyer_offices, :force => true do |t|
    t.integer :agent_office_id
    t.text :co_buyer_office_aor, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :co_buyer_office_email, limit: 80
    t.string :co_buyer_office_fax, limit: 16
    t.string :co_buyer_office_key, limit: 255
    t.string :co_buyer_office_key_numeric, limit: 255 # TODO: validates :co_buyer_office_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :co_buyer_office_mls_id, limit: 25
    t.string :co_buyer_office_name, limit: 255
    t.string :co_buyer_office_phone, limit: 16
    t.string :co_buyer_office_phone_ext, limit: 10
    t.text :co_buyer_office_url
    t.timestamps
  end

  create_table :reso_property_listing_agent_office_co_list_agents, :force => true do |t|
    t.integer :agent_office_id
    t.text :co_list_agent_aor, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :co_list_agent_designation, limit: 50 # TODO: DELETE - String List, Multi - has_many :through
    t.string :co_list_agent_direct_phone, limit: 16
    t.string :co_list_agent_email, limit: 80
    t.string :co_list_agent_fax, limit: 16
    t.string :co_list_agent_first_name, limit: 50
    t.string :co_list_agent_full_name, limit: 150
    t.string :co_list_agent_home_phone, limit: 16
    t.string :co_list_agent_key, limit: 255
    t.string :co_list_agent_key_numeric, limit: 255 # TODO: validates :co_list_agent_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :co_list_agent_last_name, limit: 50
    t.string :co_list_agent_middle_name, limit: 50
    t.string :co_list_agent_mls_id, limit: 25
    t.string :co_list_agent_mobile_phone, limit: 16
    t.string :co_list_agent_name_prefix, limit: 10
    t.string :co_list_agent_name_suffix, limit: 10
    t.string :co_list_agent_office_phone, limit: 16
    t.string :co_list_agent_office_phone_ext, limit: 10
    t.string :co_list_agent_pager, limit: 16
    t.string :co_list_agent_preferred_phone, limit: 16
    t.string :co_list_agent_preferred_phone_ext, limit: 10
    t.string :co_list_agent_state_license, limit: 50
    t.string :co_list_agent_toll_free_phone, limit: 16
    t.text :co_list_agent_url
    t.string :co_list_agent_voice_mail, limit: 16
    t.string :co_list_agent_voice_mail_ext, limit: 10
    t.timestamps
  end

  create_table :reso_property_listing_agent_office_co_list_offices, :force => true do |t|
    t.integer :agent_office_id
    t.text :co_list_office_aor, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :co_list_office_email, limit: 80
    t.string :co_list_office_fax, limit: 16
    t.string :co_list_office_key, limit: 255
    t.string :co_list_office_key_numeric, limit: 255 # TODO: validates :co_list_office_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :co_list_office_mls_id, limit: 25
    t.string :co_list_office_name, limit: 255
    t.string :co_list_office_phone, limit: 16
    t.string :co_list_office_phone_ext, limit: 10
    t.text :co_list_office_url
    t.timestamps
  end

  create_table :reso_property_listing_agent_office_list_agents, :force => true do |t|
    t.integer :agent_office_id
    t.text :list_agent_aor, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :list_agent_designation, limit: 50 # TODO: DELETE - String List, Multi - has_many :through
    t.string :list_agent_direct_phone, limit: 16
    t.string :list_agent_email, limit: 80
    t.string :list_agent_fax, limit: 16
    t.string :list_agent_first_name, limit: 50
    t.string :list_agent_full_name, limit: 150
    t.string :list_agent_home_phone, limit: 16
    t.string :list_agent_key, limit: 255
    t.string :list_agent_key_numeric, limit: 255 # TODO: validates :list_agent_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :list_agent_last_name, limit: 50
    t.string :list_agent_middle_name, limit: 50
    t.string :list_agent_mls_id, limit: 25
    t.string :list_agent_mobile_phone, limit: 16
    t.string :list_agent_name_prefix, limit: 10
    t.string :list_agent_name_suffix, limit: 10
    t.string :list_agent_office_phone, limit: 16
    t.string :list_agent_office_phone_ext, limit: 10
    t.string :list_agent_pager, limit: 16
    t.string :list_agent_preferred_phone, limit: 16
    t.string :list_agent_preferred_phone_ext, limit: 10
    t.string :list_agent_state_license, limit: 50
    t.string :list_agent_toll_free_phone, limit: 16
    t.text :list_agent_url
    t.string :list_agent_voice_mail, limit: 16
    t.string :list_agent_voice_mail_ext, limit: 10
    t.timestamps
  end

  create_table :reso_property_listing_agent_office_list_offices, :force => true do |t|
    t.integer :agent_office_id
    t.text :list_office_aor, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :list_office_email, limit: 80
    t.string :list_office_fax, limit: 16
    t.string :list_office_key, limit: 255
    t.string :list_office_key_numeric, limit: 255 # TODO: validates :list_office_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :list_office_mls_id, limit: 25
    t.string :list_office_name, limit: 255
    t.string :list_office_phone, limit: 16
    t.string :list_office_phone_ext, limit: 10
    t.text :list_office_url
    t.timestamps
  end

  create_table :reso_property_listing_agent_office_teams, :force => true do |t|
    t.integer :agent_office_id
    t.string :buyer_team_key, limit: 255
    t.string :buyer_team_key_numeric, limit: 255 # TODO: validates :buyer_team_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :buyer_team_name, limit: 50
    t.string :list_team_key, limit: 255
    t.string :list_team_key_numeric, limit: 255 # TODO: validates :list_team_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :list_team_name, limit: 50
    t.timestamps
  end

  create_table :reso_property_listing_closings, :force => true do |t|
    t.integer :listing_id
    t.date :availability_date
    t.text :buyer_financing, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :concessions, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :concessions_amount, limit: 11 # TODO: validates :concessions_amount, format: { with: /A[0-9]+z/ }
    t.string :concessions_comments, limit: 200
    t.text :contingency
    t.text :possession, limit: 255 # TODO: DELETE - String List, Multi - has_many :through
    t.timestamps
  end

  create_table :reso_property_listing_compensations, :force => true do |t|
    t.integer :listing_id
    t.string :buyer_agency_compensation, limit: 25
    t.text :buyer_agency_compensation_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.boolean :dual_variable_compensation_yn
    t.text :lease_renewal_compensation, limit: 255 # TODO: DELETE - String List, Multi - has_many :through
    t.string :sub_agency_compensation, limit: 25
    t.text :sub_agency_compensation_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :transaction_broker_compensation, limit: 25
    t.text :transaction_broker_compensation_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.timestamps
  end

  create_table :reso_property_listing_contracts, :force => true do |t|
    t.integer :listing_id
    t.text :common_interest, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :current_financing, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :disclosures, limit: 4000 # TODO: DELETE - String List, Multi - has_many :through
    t.text :exclusions
    t.text :inclusions
    t.text :listing_terms, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :ownership
    t.text :special_listing_conditions, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.timestamps
  end

  create_table :reso_property_listing_dates, :force => true do |t|
    t.integer :listing_id
    t.date :cancelation_date
    t.date :close_date
    t.date :contingent_date
    t.date :contract_status_change_date
    t.integer :cumulative_days_on_market # TODO: verify length of .to_s to max 4
    t.integer :days_on_market # TODO: verify length of .to_s to max 4
    t.date :expiration_date
    t.date :listing_contract_date
    t.datetime :major_change_timestamp
    t.text :major_change_type, limit: 255 # TODO: DELETE - String List, Single - has_one :through
    t.datetime :modification_timestamp
    t.date :off_market_date
    t.datetime :off_market_timestamp
    t.date :on_market_date
    t.datetime :on_market_timestamp
    t.datetime :original_entry_timestamp
    t.datetime :pending_timestamp
    t.datetime :price_change_timestamp
    t.date :purchase_contract_date
    t.datetime :status_change_timestamp
    t.date :withdrawn_date
    t.timestamps
  end

  create_table :reso_property_listing_marketings, :force => true do |t|
    t.integer :listing_id
    t.boolean :internet_address_display_yn
    t.boolean :internet_automated_valuation_display_yn
    t.boolean :internet_consumer_comment_yn
    t.boolean :internet_entire_listing_display_yn
    t.boolean :sign_on_property_yn
    t.text :syndicate_to, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :virtual_tour_url_branded
    t.text :virtual_tour_url_unbranded
    t.timestamps
  end

  create_table :reso_property_listing_media, :force => true do |t|
    t.integer :listing_id
    t.text :documents_available, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.datetime :documents_change_timestamp
    t.integer :documents_count # TODO: verify length of .to_s to max 2
    t.datetime :photos_change_timestamp
    t.integer :photos_count # TODO: verify length of .to_s to max 2
    t.datetime :videos_change_timestamp
    t.integer :videos_count # TODO: verify length of .to_s to max 2
    t.timestamps
  end

  create_table :reso_property_listing_prices, :force => true do |t|
    t.integer :listing_id
    t.decimal :close_price, limit: 14, precision: 2
    t.decimal :list_price, limit: 14, precision: 2
    t.decimal :list_price_low, limit: 14, precision: 2
    t.decimal :original_list_price, limit: 14, precision: 2
    t.decimal :previous_list_price, limit: 14, precision: 2
    t.timestamps
  end

  create_table :reso_property_listing_remarks, :force => true do |t|
    t.integer :listing_id
    t.text :private_office_remarks
    t.text :private_remarks
    t.text :public_remarks
    t.text :syndication_remarks
    t.timestamps
  end

  create_table :reso_property_listing_showings, :force => true do |t|
    t.integer :listing_id
    t.string :access_code, limit: 25
    t.string :lock_box_location, limit: 255
    t.string :lock_box_serial_number, limit: 25
    t.text :lock_box_type, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.integer :showing_advance_notice # TODO: verify length of .to_s to max 2
    t.boolean :showing_attended_yn
    t.string :showing_contact_name, limit: 40
    t.string :showing_contact_phone, limit: 16
    t.string :showing_contact_phone_ext, limit: 10
    t.text :showing_contact_type, limit: 75 # TODO: DELETE - String List, Multi - has_many :through
    t.text :showing_days, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.datetime :showing_end_time
    t.text :showing_instructions
    t.text :showing_requirements, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.datetime :showing_start_time
    t.timestamps
  end

  create_table :reso_property_locations, :force => true do |t|
    t.integer :property_id
    t.timestamps
  end

  create_table :reso_property_location_addresses, :force => true do |t|
    t.integer :location_id
    t.string :carrier_route, limit: 9
    t.text :city, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :country, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.text :county_or_parish, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :postal_city, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :postal_code, limit: 10
    t.string :postal_code_plus4, limit: 4
    t.text :state_or_province, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.string :street_additional_info, limit: 50
    t.text :street_dir_prefix, limit: 15 # TODO: DELETE - String List, Single - has_one :through
    t.text :street_dir_suffix, limit: 15 # TODO: DELETE - String List, Single - has_one :through
    t.string :street_name, limit: 50
    t.string :street_number, limit: 25
    t.string :street_number_numeric, limit: 10 # TODO: validates :street_number_numeric, format: { with: /A[0-9]+z/ }
    t.text :street_suffix, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :street_suffix_modifier, limit: 25
    t.string :township, limit: 50
    t.string :unit_number, limit: 25
    t.string :unparsed_address, limit: 255
    t.timestamps
  end

  create_table :reso_property_location_areas, :force => true do |t|
    t.integer :location_id
    t.string :city_region, limit: 150
    t.string :continent_region, limit: 150
    t.string :country_region, limit: 150
    t.text :mls_area_major, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :mls_area_minor, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :state_region, limit: 150
    t.string :subdivision_name, limit: 50
    t.timestamps
  end

  create_table :reso_property_location_gis, :force => true do |t|
    t.integer :location_id
    t.string :cross_street, limit: 50
    t.text :directions
    t.integer :elevation # TODO: verify length of .to_s to max 5
    t.text :elevation_units, limit: 10 # TODO: DELETE - String List, Single - has_one :through
    t.decimal :latitude, limit: 12, precision: 8
    t.decimal :longitude, limit: 12, precision: 8
    t.string :map_coordinate, limit: 25
    t.string :map_coordinate_source, limit: 25
    t.text :map_url
    t.timestamps
  end

  create_table :reso_property_location_schools, :force => true do |t|
    t.integer :location_id
    t.text :elementary_school, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :elementary_school_district, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :high_school, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :high_school_district, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :middle_or_junior_school, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :middle_or_junior_school_district, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.timestamps
  end

  create_table :reso_property_occupant_owners, :force => true do |t|
    t.integer :property_id
    t.string :occupant_name, limit: 50
    t.string :occupant_phone, limit: 16
    t.text :occupant_type, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :owner_name, limit: 50
    t.string :owner_phone, limit: 16
    t.timestamps
  end

  create_table :reso_property_structures, :force => true do |t|
    t.integer :property_id
    t.decimal :above_grade_finished_area, limit: 14, precision: 2
    t.text :above_grade_finished_area_source, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :above_grade_finished_area_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :accessibility_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :architectural_style, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.boolean :attached_garage_yn
    t.text :basement, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.integer :bathrooms_full # TODO: verify length of .to_s to max 3
    t.integer :bathrooms_half # TODO: verify length of .to_s to max 3
    t.integer :bathrooms_one_quarter # TODO: verify length of .to_s to max 3
    t.integer :bathrooms_partial # TODO: verify length of .to_s to max 3
    t.integer :bathrooms_three_quarter # TODO: verify length of .to_s to max 3
    t.integer :bathrooms_total_integer # TODO: verify length of .to_s to max 3
    t.integer :bedrooms_possible # TODO: verify length of .to_s to max 3
    t.integer :bedrooms_total # TODO: verify length of .to_s to max 3
    t.decimal :below_grade_finished_area, limit: 14, precision: 2
    t.text :below_grade_finished_area_source, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :below_grade_finished_area_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :body_type, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.string :builder_model, limit: 50
    t.string :builder_name, limit: 50
    t.text :building_area_source, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.decimal :building_area_total, limit: 14, precision: 2
    t.text :building_area_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :building_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.string :building_name, limit: 50
    t.decimal :carport_spaces, limit: 14, precision: 2
    t.boolean :carport_yn
    t.text :common_walls, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :construction_materials, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :cooling, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.boolean :cooling_yn
    t.decimal :covered_spaces, limit: 14, precision: 2
    t.string :doh1, limit: 25
    t.string :doh2, limit: 25
    t.string :doh3, limit: 25
    t.text :direction_faces, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :door_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.integer :entry_level # TODO: verify length of .to_s to max 4
    t.string :entry_location, limit: 50
    t.text :exterior_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :fireplace_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.boolean :fireplace_yn
    t.integer :fireplaces_total # TODO: verify length of .to_s to max 3
    t.text :flooring, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :foundation_area, limit: 14, precision: 2
    t.text :foundation_details, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :garage_spaces, limit: 14, precision: 2
    t.boolean :garage_yn
    t.boolean :habitable_residence_yn
    t.text :heating, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.boolean :heating_yn
    t.text :interior_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :leasable_area, limit: 14, precision: 2
    t.text :leasable_area_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :levels, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.string :license1, limit: 25
    t.string :license2, limit: 25
    t.string :license3, limit: 25
    t.decimal :living_area, limit: 14, precision: 2
    t.text :living_area_source, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :living_area_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.integer :main_level_bathrooms # TODO: verify length of .to_s to max 3
    t.integer :main_level_bedrooms # TODO: verify length of .to_s to max 3
    t.string :make, limit: 50
    t.text :mobile_dim_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.integer :mobile_length # TODO: verify length of .to_s to max 4
    t.integer :mobile_width # TODO: verify length of .to_s to max 4
    t.string :model, limit: 50
    t.boolean :new_construction_yn
    t.decimal :open_parking_spaces, limit: 14, precision: 2
    t.boolean :open_parking_yn
    t.text :other_parking
    t.text :other_structures, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :parking_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :parking_total, limit: 14, precision: 2
    t.text :patio_and_porch_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.boolean :property_attached_yn
    t.text :property_condition, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.string :rv_parking_dimensions, limit: 50
    t.text :roof, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.string :serial_u, limit: 25
    t.string :serial_x, limit: 25
    t.string :serial_xx, limit: 25
    t.text :skirt, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.integer :stories # TODO: verify length of .to_s to max 2
    t.integer :stories_total # TODO: verify length of .to_s to max 3
    t.text :structure_type, limit: 25 # TODO: DELETE - String List, Multi - has_many :through
    t.text :window_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.integer :year_built # TODO: verify length of .to_s to max 4
    t.text :year_built_details
    t.integer :year_built_effective # TODO: verify length of .to_s to max 4
#    t.text :year_built_source, limit: 60 # TODO: DELETE - String List, Single - has_one :through
    t.timestamps
  end

  create_table :reso_property_structure_performance_green_marketings, :force => true do |t|
    t.integer :performance_id
    t.text :green_energy_efficient, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :green_energy_generation, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :green_indoor_air_quality, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :green_location, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :green_sustainability, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.text :green_water_conservation, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.integer :walk_score # TODO: verify length of .to_s to max 3
    t.timestamps
  end

  create_table :reso_property_structure_performances, :force => true do |t|
    t.integer :structure_id
    t.timestamps
  end

  create_table :reso_property_structure_performance_green_verifications, :force => true do |t|
    t.integer :performance_id
    t.string :green_building_verification # TODO: DELETE - Collection - has_many :through
    t.text :green_building_verification_type, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    # TODO: Handle dynamic fields - t.string :green_verification[type]body, limit: 50
    # TODO: Handle dynamic fields - t.integer :green_verification[type]metric # TODO: verify length of .to_s to max 3
    # TODO: Handle dynamic fields - t.string :green_verification[type]rating, limit: 50
    # TODO: Handle dynamic fields - t.text :green_verification[type]source, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.text :green_verification[type]status, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.text :green_verification[type]url
    # TODO: Handle dynamic fields - t.string :green_verification[type]version, limit: 25
    # TODO: Handle dynamic fields - t.integer :green_verification[type]year # TODO: verify length of .to_s to max 4
    t.timestamps
  end

  create_table :reso_property_structure_rooms, :force => true do |t|
    t.integer :structure_id
    t.text :room_type, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    # TODO: Handle dynamic fields - t.decimal :room[type]area, limit: 14, precision: 2
    # TODO: Handle dynamic fields - t.text :room[type]area_source, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.text :room[type]area_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.text :room[type]description
    # TODO: Handle dynamic fields - t.string :room[type]dimensions, limit: 50
    # TODO: Handle dynamic fields - t.text :room[type]features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    # TODO: Handle dynamic fields - t.decimal :room[type]length, limit: 14, precision: 2
    # TODO: Handle dynamic fields - t.text :room[type]length_width_source, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.text :room[type]length_width_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.text :room[type]level, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.decimal :room[type]width, limit: 14, precision: 2
    t.string :rooms # TODO: DELETE - Collection - has_many :through
    t.integer :rooms_total # TODO: verify length of .to_s to max 3
    t.timestamps
  end

  create_table :reso_property_taxes, :force => true do |t|
    t.integer :property_id
    t.string :additional_parcels_description, limit: 255
    t.boolean :additional_parcels_yn
    t.string :parcel_number, limit: 50
    t.string :public_survey_range, limit: 20
    t.string :public_survey_section, limit: 20
    t.string :public_survey_township, limit: 20
    t.decimal :tax_annual_amount, limit: 14, precision: 2
    t.string :tax_assessed_value, limit: 14 # TODO: validates :tax_assessed_value, format: { with: /A[0-9]+z/ }
    t.string :tax_block, limit: 25
    t.string :tax_book_number, limit: 25
    t.text :tax_legal_description
    t.string :tax_lot, limit: 25
    t.string :tax_map_number, limit: 25
    t.decimal :tax_other_annual_assessment_amount, limit: 14, precision: 2
    t.string :tax_parcel_letter, limit: 25
    t.text :tax_status_current, limit: 50 # TODO: DELETE - String List, Multi - has_many :through
    t.string :tax_tract, limit: 25
    t.integer :tax_year # TODO: verify length of .to_s to max 4
    t.string :zoning, limit: 25
    t.string :zoning_description
    t.timestamps
  end

  create_table :reso_property_unit_types, :force => true do |t|
    t.integer :property_id
    t.text :unit_type_type, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    # TODO: Handle dynamic fields - t.decimal :unit_type[type]actual_rent, limit: 14, precision: 2
    # TODO: Handle dynamic fields - t.integer :unit_type[type]baths_total # TODO: verify length of .to_s to max 3
    # TODO: Handle dynamic fields - t.integer :unit_type[type]beds_total # TODO: verify length of .to_s to max 3
    # TODO: Handle dynamic fields - t.text :unit_type[type]description
    # TODO: Handle dynamic fields - t.text :unit_type[type]furnished, limit: 20 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.boolean :unit_type[type]garage_attached_yn
    # TODO: Handle dynamic fields - t.decimal :unit_type[type]garage_spaces, limit: 14, precision: 2
    # TODO: Handle dynamic fields - t.integer :unit_type[type]pro_forma # TODO: verify length of .to_s to max 6
    # TODO: Handle dynamic fields - t.decimal :unit_type[type]total_rent, limit: 14, precision: 2
    # TODO: Handle dynamic fields - t.integer :unit_type[type]units_total # TODO: verify length of .to_s to max 3
    t.string :unit_types # TODO: DELETE - Collection - has_many :through
    t.string :listing_id, limit: 255
    t.string :listing_key, limit: 255
    t.string :listing_key_numeric, limit: 255 # TODO: validates :listing_key_numeric, format: { with: /A[0-9]+z/ }
    t.datetime :modification_timestamp
    t.decimal :unit_type_actual_rent, limit: 14, precision: 2
    t.integer :unit_type_baths_total # TODO: verify length of .to_s to max 3
    t.integer :unit_type_beds_total # TODO: verify length of .to_s to max 3
    t.text :unit_type_description
    t.text :unit_type_furnished, limit: 20 # TODO: DELETE - String List, Single - has_one :through
    t.boolean :unit_type_garage_attached_yn
    t.decimal :unit_type_garage_spaces, limit: 14, precision: 2
    t.string :unit_type_key, limit: 255
    t.string :unit_type_key_numeric, limit: 255 # TODO: validates :unit_type_key_numeric, format: { with: /A[0-9]+z/ }
    t.integer :unit_type_pro_forma # TODO: verify length of .to_s to max 6
    t.decimal :unit_type_total_rent, limit: 14, precision: 2
    t.text :unit_type_type, limit: 1024 # TODO: DELETE - String List, Single - has_one :through
    t.integer :unit_type_units_total # TODO: verify length of .to_s to max 3
    t.timestamps
  end

  create_table :reso_property_utilities, :force => true do |t|
    t.integer :property_id
    t.string :distance_to_bus_comments, limit: 255
    t.string :distance_to_bus_numeric, limit: 16 # TODO: validates :distance_to_bus_numeric, format: { with: /A[0-9]+z/ }
    t.text :distance_to_bus_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :distance_to_electric_comments, limit: 255
    t.string :distance_to_electric_numeric, limit: 16 # TODO: validates :distance_to_electric_numeric, format: { with: /A[0-9]+z/ }
    t.text :distance_to_electric_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :distance_to_freeway_comments, limit: 255
    t.string :distance_to_freeway_numeric, limit: 16 # TODO: validates :distance_to_freeway_numeric, format: { with: /A[0-9]+z/ }
    t.text :distance_to_freeway_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :distance_to_gas_comments, limit: 255
    t.string :distance_to_gas_numeric, limit: 16 # TODO: validates :distance_to_gas_numeric, format: { with: /A[0-9]+z/ }
    t.text :distance_to_gas_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :distance_to_phone_service_comments, limit: 255
    t.string :distance_to_phone_service_numeric, limit: 16 # TODO: validates :distance_to_phone_service_numeric, format: { with: /A[0-9]+z/ }
    t.text :distance_to_phone_service_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :distance_to_placeof_worship_comments, limit: 255
    t.string :distance_to_placeof_worship_numeric, limit: 16 # TODO: validates :distance_to_placeof_worship_numeric, format: { with: /A[0-9]+z/ }
    t.text :distance_to_placeof_worship_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :distance_to_school_bus_comments, limit: 255
    t.string :distance_to_school_bus_numeric, limit: 16 # TODO: validates :distance_to_school_bus_numeric, format: { with: /A[0-9]+z/ }
    t.text :distance_to_school_bus_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :distance_to_schools_comments, limit: 255
    t.string :distance_to_schools_numeric, limit: 16 # TODO: validates :distance_to_schools_numeric, format: { with: /A[0-9]+z/ }
    t.text :distance_to_schools_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :distance_to_sewer_comments, limit: 255
    t.string :distance_to_sewer_numeric, limit: 16 # TODO: validates :distance_to_sewer_numeric, format: { with: /A[0-9]+z/ }
    t.text :distance_to_sewer_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :distance_to_shopping_comments, limit: 255
    t.string :distance_to_shopping_numeric, limit: 16 # TODO: validates :distance_to_shopping_numeric, format: { with: /A[0-9]+z/ }
    t.text :distance_to_shopping_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :distance_to_street_comments, limit: 255
    t.string :distance_to_street_numeric, limit: 16 # TODO: validates :distance_to_street_numeric, format: { with: /A[0-9]+z/ }
    t.text :distance_to_street_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :distance_to_water_comments, limit: 255
    t.string :distance_to_water_numeric, limit: 16 # TODO: validates :distance_to_water_numeric, format: { with: /A[0-9]+z/ }
    t.text :distance_to_water_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :electric, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.boolean :electric_on_property_yn
    t.text :irrigation_source, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.decimal :irrigation_water_rights_acres, limit: 16, precision: 4
    t.boolean :irrigation_water_rights_yn
    t.integer :number_of_separate_electric_meters # TODO: verify length of .to_s to max 3
    t.integer :number_of_separate_gas_meters # TODO: verify length of .to_s to max 3
    t.integer :number_of_separate_water_meters # TODO: verify length of .to_s to max 3
    t.string :power_production # TODO: DELETE - Collection - has_many :through
    t.text :power_production_type, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    # TODO: Handle dynamic fields - t.integer :power_production[type]annual # TODO: verify length of .to_s to max 6
    # TODO: Handle dynamic fields - t.text :power_production[type]annual_status, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.decimal :power_production[type]size, limit: 5, precision: 2
    # TODO: Handle dynamic fields - t.integer :power_production[type]year_install # TODO: verify length of .to_s to max 4
    t.text :sewer, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
#    t.text :utilities, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
#    t.text :water_source, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.timestamps
  end

  create_table :reso_members, :force => true do |t|
    t.string :job_title, limit: 50
    t.datetime :last_login_timestamp
    t.text :member_aor, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :member_aor_mls_id, limit: 25
    t.string :member_ao_rkey, limit: 255
    t.string :member_ao_rkey_numeric, limit: 255 # TODO: validates :member_ao_rkey_numeric, format: { with: /A[0-9]+z/ }
    t.string :member_address1, limit: 50
    t.string :member_address2, limit: 50
    t.text :member_association_comments
    t.string :member_carrier_route, limit: 9
    t.string :member_city, limit: 50
    t.text :member_country, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.text :member_county_or_parish, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :member_designation, limit: 50 # TODO: DELETE - String List, Multi - has_many :through
    t.string :member_direct_phone, limit: 16
    t.string :member_email
    t.string :member_fax, limit: 16
    t.string :member_first_name, limit: 50
    t.string :member_full_name, limit: 150
    t.string :member_home_phone, limit: 16
    t.string :member_is_assistant_to, limit: 50
    t.string :member_key, limit: 255
    t.string :member_key_numeric, limit: 255 # TODO: validates :member_key_numeric, format: { with: /A[0-9]+z/ }
    t.text :member_languages, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.string :member_last_name, limit: 50
    t.string :member_login_id, limit: 25
    t.string :member_middle_name, limit: 50
    t.boolean :member_mls_access_yn
    t.string :member_mls_id, limit: 25
    t.text :member_mls_security_class, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :member_mobile_phone, limit: 16
    t.string :member_name_prefix, limit: 10
    t.string :member_name_suffix, limit: 10
    t.string :member_national_association_id, limit: 25
    t.string :member_nickname, limit: 50
    t.string :member_office_phone, limit: 16
    t.string :member_office_phone_ext, limit: 10
    t.string :member_other_phone
    t.text :member_other_phone_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.string :member_other_phone[type]ext, limit: 10
    # TODO: Handle dynamic fields - t.string :member_other_phone[type]number, limit: 16
    t.string :member_pager, limit: 16
    t.string :member_password, limit: 25
    t.string :member_phone_ttytdd, limit: 16
    t.string :member_postal_code, limit: 10
    t.string :member_postal_code_plus4, limit: 4
    t.string :member_preferred_phone, limit: 16
    t.string :member_preferred_phone_ext, limit: 10
    t.string :member_state_license, limit: 50
    t.text :member_state_license_state, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.text :member_state_or_province, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.text :member_status, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :member_toll_free_phone, limit: 16
    t.text :member_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :member_voice_mail, limit: 16
    t.string :member_voice_mail_ext, limit: 10
    t.datetime :modification_timestamp
    t.string :office_key, limit: 255
    t.string :office_key_numeric, limit: 255 # TODO: validates :office_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :office_mls_id, limit: 25
    t.string :office_name, limit: 255
    t.datetime :original_entry_timestamp
    t.string :originating_system_id, limit: 25
    t.string :originating_system_member_key, limit: 255
    t.string :originating_system_name, limit: 255
    t.string :member_social_media
    t.text :social_media_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.text :social_media[type]url_or_id
    t.string :source_system_id, limit: 25
    t.string :source_system_member_key, limit: 255
    t.string :source_system_name, limit: 255
    t.text :syndicate_to, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.timestamps
  end

  create_table :reso_offices, :force => true do |t|
    t.string :franchise_affiliation, limit: 50
    t.boolean :idx_office_participation_yn
    t.string :main_office_key, limit: 255
    t.string :main_office_key_numeric, limit: 255 # TODO: validates :main_office_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :main_office_mls_id, limit: 25
    t.datetime :modification_timestamp
    t.text :office_aor, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :office_aor_mls_id, limit: 25
    t.string :office_ao_rkey, limit: 255
    t.string :office_ao_rkey_numeric, limit: 255 # TODO: validates :office_ao_rkey_numeric, format: { with: /A[0-9]+z/ }
    t.string :office_address1, limit: 50
    t.string :office_address2, limit: 50
    t.text :office_association_comments
    t.text :office_branch_type, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :office_broker_key, limit: 255
    t.string :office_broker_key_numeric, limit: 255 # TODO: validates :office_broker_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :office_broker_mls_id, limit: 25
    t.string :office_city, limit: 50
    t.string :office_corporate_license, limit: 50
    t.text :office_county_or_parish, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :office_email, limit: 80
    t.string :office_fax, limit: 16
    t.string :office_key, limit: 255
    t.string :office_key_numeric, limit: 255 # TODO: validates :office_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :office_manager_key, limit: 255
    t.string :office_manager_key_numeric, limit: 255 # TODO: validates :office_manager_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :office_manager_mls_id, limit: 25
    t.string :office_mls_id, limit: 25
    t.string :office_name, limit: 255
    t.string :office_national_association_id, limit: 25
    t.string :office_phone, limit: 16
    t.string :office_phone_ext, limit: 10
    t.string :office_postal_code, limit: 10
    t.string :office_postal_code_plus4, limit: 4
    t.text :office_state_or_province, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.text :office_status, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :office_type, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.datetime :original_entry_timestamp
    t.string :originating_system_id, limit: 25
    t.string :originating_system_name, limit: 255
    t.string :originating_system_office_key, limit: 255
    t.string :office_social_media
    t.text :social_media_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.text :social_media[type]url_or_id
    t.string :source_system_id, limit: 25
    t.string :source_system_name, limit: 255
    t.string :source_system_office_key, limit: 255
    t.text :syndicate_agent_option, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :syndicate_to, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.timestamps
  end

  create_table :reso_contacts, :force => true do |t|
    t.date :anniversary
    t.string :assistant_email, limit: 80
    t.string :assistant_name, limit: 150
    t.string :assistant_phone, limit: 16
    t.string :assistant_phone_ext, limit: 10
    t.date :birthdate
    t.string :business_fax, limit: 16
    t.string :children, limit: 150
    t.string :company, limit: 50
    t.string :contact_key, limit: 255
    t.string :contact_key_numeric, limit: 255 # TODO: validates :contact_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :contact_login_id, limit: 25
    t.string :contact_password, limit: 25
    t.text :contact_status, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :contact_type, limit: 255 # TODO: DELETE - String List, Multi - has_many :through
    t.string :contacts_other_phone # TODO: DELETE - Collection - has_many :through
    t.string :contacts_social_media # TODO: DELETE - Collection - has_many :through
    t.string :department, limit: 50
    t.string :direct_phone, limit: 16
    t.string :email, limit: 80
    t.string :email2, limit: 80
    t.string :email3, limit: 80
    t.string :first_name, limit: 50
    t.string :full_name, limit: 150
    t.string :home_address1, limit: 50
    t.string :home_address2, limit: 50
    t.string :home_carrier_route, limit: 9
    t.string :home_city, limit: 50
    t.text :home_country, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.text :home_county_or_parish, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :home_fax, limit: 16
    t.string :home_phone, limit: 16
    t.string :home_postal_code, limit: 10
    t.string :home_postal_code_plus4, limit: 4
    t.text :home_state_or_province, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.string :job_title, limit: 50
    t.text :language, limit: 150 # TODO: DELETE - String List, Multi - has_many :through
    t.string :last_name, limit: 50
    t.string :lead_source, limit: 150
    t.string :middle_name, limit: 50
    t.string :mobile_phone, limit: 16
    t.datetime :modification_timestamp
    t.string :name_prefix, limit: 10
    t.string :name_suffix, limit: 10
    t.string :nickname, limit: 50
    t.text :notes
    t.string :office_phone, limit: 16
    t.string :office_phone_ext, limit: 10
    t.datetime :original_entry_timestamp
    t.string :originating_system_contact_key, limit: 255
    t.string :originating_system_id, limit: 25
    t.string :originating_system_name, limit: 255
    t.string :other_address1, limit: 50
    t.string :other_address2, limit: 50
    t.string :other_carrier_route, limit: 9
    t.string :other_city, limit: 50
    t.text :other_country, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.text :other_county_or_parish, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :other_phone_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.string :other_phone[type]ext, limit: 10
    # TODO: Handle dynamic fields - t.string :other_phone[type]number, limit: 16
    t.string :other_postal_code, limit: 10
    t.string :other_postal_code_plus4, limit: 4
    t.text :other_state_or_province, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.string :owner_member_id, limit: 25
    t.string :owner_member_key, limit: 255
    t.string :owner_member_key_numeric, limit: 255 # TODO: validates :owner_member_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :pager, limit: 16
    t.string :phone_ttyttd, limit: 16
    t.text :preferred_address, limit: 255 # TODO: DELETE - String List, Single - has_one :through
    t.text :preferred_phone, limit: 255 # TODO: DELETE - String List, Single - has_one :through
    t.string :referred_by, limit: 150
    t.text :social_media_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.text :social_media[type]url_or_id
    t.string :source_system_contact_key, limit: 255
    t.string :source_system_id, limit: 25
    t.string :source_system_name, limit: 255
    t.string :spouse_partner_name, limit: 150
    t.string :toll_free_phone, limit: 16
    # TODO: t.text :user_defined_field_name[#]
    # TODO: t.text :user_defined_field_value[#]
    t.string :voice_mail, limit: 16
    t.string :voice_mail_ext, limit: 10
    t.string :work_address1, limit: 50
    t.string :work_address2, limit: 50
    t.string :work_carrier_route, limit: 9
    t.string :work_city, limit: 50
    t.text :work_country, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.text :work_county_or_parish, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :work_postal_code, limit: 10
    t.string :work_postal_code_plus4, limit: 4
    t.text :work_state_or_province, limit: 2 # TODO: DELETE - String List, Single - has_one :through    
    t.timestamps
  end

  create_table :reso_contact_listings, :force => true do |t|
    t.boolean :agent_notes_unread_yn
    t.text :class_name, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :contact_key, limit: 255
    t.string :contact_key_numeric, limit: 255 # TODO: validates :contact_key_numeric, format: { with: /A[0-9]+z/ }
    t.text :contact_listing_preference, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :contact_listings_key, limit: 255
    t.string :contact_listings_key_numeric, limit: 255 # TODO: validates :contact_listings_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :contact_login_id, limit: 25
    t.boolean :contact_notes_unread_yn
    t.boolean :direct_email_yn
    t.datetime :last_agent_note_timestamp
    t.datetime :last_contact_note_timestamp
    t.string :listing_id, limit: 255
    t.string :listing_key, limit: 255
    t.string :listing_key_numeric, limit: 255 # TODO: validates :listing_key_numeric, format: { with: /A[0-9]+z/ }
    t.datetime :listing_modification_timestamp
    t.string :listing_notes # TODO: DELETE - Collection - has_many :through
    t.datetime :listing_sent_timestamp
    t.boolean :listing_viewed_yn
    t.datetime :modification_timestamp
    t.datetime :portal_last_visited_timestamp
    t.text :resource_name, limit: 50 # TODO: DELETE - String List, Single - has_one :through    
    t.timestamps
  end

  create_table :reso_media, :force => true do |t|
    t.string :changed_by_member_id, limit: 25
    t.string :changed_by_member_key, limit: 255
    t.string :changed_by_member_key_numeric, limit: 255 # TODO: validates :changed_by_member_key_numeric, format: { with: /A[0-9]+z/ }
    t.text :class_name, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.integer :image_height # TODO: verify length of .to_s to max 8
    t.text :image_of, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :image_size_description, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.integer :image_width # TODO: verify length of .to_s to max 8
    t.text :long_description
    t.text :media_category, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :media_html
    t.string :media_key, limit: 255
    t.string :media_key_numeric, limit: 255 # TODO: validates :media_key_numeric, format: { with: /A[0-9]+z/ }
    t.datetime :media_modification_timestamp
    t.string :media_object_id, limit: 255
    t.text :media_status, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :media_type, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :media_url
    t.datetime :modification_timestamp
    t.integer :order # TODO: verify length of .to_s to max 4
    t.string :originating_system_id, limit: 25
    t.string :originating_system_media_key, limit: 255
    t.string :originating_system_name, limit: 255
    t.text :permission, limit: 255 # TODO: DELETE - String List, Multi - has_many :through
    t.boolean :preferred_photo_yn
    t.text :resource_name, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :resource_record_id, limit: 255
    t.string :resource_record_key, limit: 255
    t.string :resource_record_key_numeric, limit: 255 # TODO: validates :resource_record_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :short_description, limit: 50
    t.string :source_system_id, limit: 25
    t.string :source_system_media_key, limit: 255
    t.string :source_system_name, limit: 255
    t.timestamps
  end

  create_table :reso_history_transactionals, :force => true do |t|
    t.text :change_type, limit: 255 # TODO: DELETE - String List, Single - has_one :through
    t.string :changed_by_member_id, limit: 25
    t.string :changed_by_member_key, limit: 255
    t.string :changed_by_member_key_numeric, limit: 255 # TODO: validates :changed_by_member_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :class_name, limit: 255
    t.string :field_key, limit: 255
    t.string :field_key_numeric, limit: 255 # TODO: validates :field_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :field_name, limit: 255
    t.string :history_transactional_key, limit: 255
    t.string :history_transactional_key_numeric, limit: 255 # TODO: validates :history_transactional_key_numeric, format: { with: /A[0-9]+z/ }
    t.datetime :modification_timestamp
    t.text :new_value
    t.string :originating_system_history_key, limit: 255
    t.string :originating_system_id, limit: 25
    t.string :originating_system_name, limit: 255
    t.text :previous_value
    t.string :resource_name, limit: 255
    t.string :resource_record_id, limit: 255
    t.string :resource_record_key, limit: 255
    t.string :resource_record_key_numeric, limit: 255 # TODO: validates :resource_record_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :source_system_history_key, limit: 255
    t.string :source_system_id, limit: 25
    t.string :source_system_name, limit: 255
    t.timestamps
  end

  create_table :reso_internet_trackings, :force => true do |t|
    t.string :actor_city, limit: 50
    t.string :actor_email, limit: 80
    t.string :actor_id, limit: 25
    t.string :actor_ip, limit: 39
    t.string :actor_key, limit: 255
    t.string :actor_key_numeric, limit: 255 # TODO: validates :actor_key_numeric, format: { with: /A[0-9]+z/ }
    t.decimal :actor_latitude, limit: 12, precision: 8
    t.decimal :actor_longitude, limit: 12, precision: 8
    t.string :actor_originating_system_id, limit: 25
    t.string :actor_originating_system_name, limit: 255
    t.string :actor_phone, limit: 16
    t.string :actor_phone_ext, limit: 10
    t.string :actor_postal_code, limit: 10
    t.string :actor_postal_code_plus4, limit: 4
    t.string :actor_region, limit: 150
    t.string :actor_source_system_id, limit: 25
    t.string :actor_source_system_name, limit: 255
    t.text :actor_state_or_province, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.text :actor_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :device_type, limit: 128 # TODO: DELETE - String List, Single - has_one :through
    t.string :originating_system_actor_key, limit: 255
    t.string :session_id, limit: 255
    t.string :source_system_actor_key, limit: 255
    t.string :user_agent, limit: 255
    t.timestamps
  end

  create_table :reso_internet_tracking_actors, :force => true do |t|
    t.integer :internet_tracking_id
    t.string :actor_city, limit: 50
    t.string :actor_email, limit: 80
    t.string :actor_id, limit: 25
    t.string :actor_ip, limit: 39
    t.string :actor_key, limit: 255
    t.string :actor_key_numeric, limit: 255 # TODO: validates :actor_key_numeric, format: { with: /A[0-9]+z/ }
    t.decimal :actor_latitude, limit: 12, precision: 8
    t.decimal :actor_longitude, limit: 12, precision: 8
    t.string :actor_originating_system_id, limit: 25
    t.string :actor_originating_system_name, limit: 255
    t.string :actor_phone, limit: 16
    t.string :actor_phone_ext, limit: 10
    t.string :actor_postal_code, limit: 10
    t.string :actor_postal_code_plus4, limit: 4
    t.string :actor_region, limit: 150
    t.string :actor_source_system_id, limit: 25
    t.string :actor_source_system_name, limit: 255
    t.text :actor_state_or_province, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.text :actor_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :device_type, limit: 128 # TODO: DELETE - String List, Single - has_one :through
    t.string :originating_system_actor_key, limit: 255
    t.string :session_id, limit: 255
    t.string :source_system_actor_key, limit: 255
    t.string :user_agent, limit: 255
    t.timestamps
  end

  create_table :reso_internet_tracking_events, :force => true do |t|
    t.integer :internet_tracking_id
    t.text :event_description
    t.string :event_key, limit: 255
    t.string :event_key_numeric, limit: 255 # TODO: validates :event_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :event_label, limit: 50
    t.string :event_originating_system_id, limit: 25
    t.string :event_originating_system_name, limit: 255
    t.string :event_source_system_id, limit: 25
    t.string :event_source_system_name, limit: 255
    t.text :event_target, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.datetime :event_timestamp
    t.text :event_type, limit: 128 # TODO: DELETE - String List, Single - has_one :through
    t.string :originating_system_event_key, limit: 255
    t.text :referring_url
    t.string :source_system_event_key, limit: 255
    t.timestamps
  end

  create_table :reso_internet_tracking_objects, :force => true do |t|
    t.integer :internet_tracking_id
    t.string :object_id, limit: 255
    t.text :object_id_type, limit: 128 # TODO: DELETE - String List, Single - has_one :through
    t.string :object_key, limit: 255
    t.string :object_key_numeric, limit: 255 # TODO: validates :object_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :object_originating_system_id, limit: 25
    t.string :object_originating_system_name, limit: 255
    t.string :object_source_system_id, limit: 25
    t.string :object_source_system_name, limit: 255
    t.text :object_type, limit: 128 # TODO: DELETE - String List, Single - has_one :through
    t.text :object_url
    t.string :originating_system_object_key, limit: 255
    t.string :source_system_object_key, limit: 255
    t.timestamps
  end

  create_table :reso_saved_searches, :force => true do |t|
    t.text :class_name, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :member_key, limit: 255
    t.string :member_key_numeric, limit: 255 # TODO: validates :member_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :member_mls_id, limit: 25
    t.datetime :modification_timestamp
    t.datetime :original_entry_timestamp
    t.string :originating_system_id, limit: 25
    t.string :originating_system_key, limit: 255
    t.string :originating_system_member_key, limit: 255
    t.string :originating_system_member_name, limit: 255
    t.string :originating_system_name, limit: 255
    t.text :resource_name, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :saved_search_description
    t.string :saved_search_key, limit: 255
    t.string :saved_search_key_numeric, limit: 255 # TODO: validates :saved_search_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :saved_search_name, limit: 255
    t.text :saved_search_type, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :search_query
    t.string :search_query_exception_details, limit: 255
    t.text :search_query_exceptions, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :search_query_human_readable, limit: 255
    t.text :search_query_type, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :source_system_id, limit: 25
    t.string :source_system_key, limit: 255
    t.string :source_system_name, limit: 255
    t.timestamps
  end

  create_table :reso_open_houses, :force => true do |t|
    t.boolean :appointment_required_yn
    t.string :listing_id, limit: 255
    t.string :listing_key, limit: 255
    t.string :listing_key_numeric, limit: 255 # TODO: validates :listing_key_numeric, format: { with: /A[0-9]+z/ }
    t.datetime :modification_timestamp
    t.text :open_house_attended_by, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.date :open_house_date
    t.datetime :open_house_end_time
    t.string :open_house_id, limit: 255
    t.string :open_house_key, limit: 255
    t.string :open_house_key_numeric, limit: 255 # TODO: validates :open_house_key_numeric, format: { with: /A[0-9]+z/ }
    t.text :open_house_remarks
    t.datetime :open_house_start_time
    t.text :open_house_status, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :open_house_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.datetime :original_entry_timestamp
    t.string :originating_system_id, limit: 25
    t.string :originating_system_key, limit: 255
    t.string :originating_system_name, limit: 255
    t.string :refreshments, limit: 255
    t.string :showing_agent_first_name, limit: 50
    t.string :showing_agent_key, limit: 255
    t.string :showing_agent_key_numeric, limit: 255 # TODO: validates :showing_agent_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :showing_agent_last_name, limit: 50
    t.string :showing_agent_mls_id, limit: 25
    t.string :source_system_id, limit: 25
    t.string :source_system_key, limit: 255
    t.string :source_system_name, limit: 255
    t.timestamps
  end

  create_table :reso_prospectings, :force => true do |t|
    t.boolean :active_yn
    t.text :bcc_email_list
    t.boolean :bcc_me_yn
    t.text :cc_email_list
    t.boolean :client_activated_yn
    t.boolean :concierge_notifications_yn
    t.boolean :concierge_yn
    t.string :contact_key, limit: 255
    t.string :contact_key_numeric, limit: 255 # TODO: validates :contact_key_numeric, format: { with: /A[0-9]+z/ }
    t.text :daily_schedule, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.string :display_template_id, limit: 25
    t.text :language, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.datetime :last_new_changed_timestamp
    t.datetime :last_viewed_timestamp
    t.text :message_new
    t.text :message_revise
    t.text :message_update
    t.datetime :modification_timestamp
    t.datetime :next_send_timestamp
    t.string :owner_member_id, limit: 25
    t.string :owner_member_key, limit: 255
    t.string :owner_member_key_numeric, limit: 255 # TODO: validates :owner_member_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :prospecting_key, limit: 255
    t.string :prospecting_key_numeric, limit: 255 # TODO: validates :prospecting_key_numeric, format: { with: /A[0-9]+z/ }
    t.text :reason_active_or_disabled, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :saved_search_key, limit: 255
    t.string :saved_search_key_numeric, limit: 255 # TODO: validates :saved_search_key_numeric, format: { with: /A[0-9]+z/ }
    t.text :schedule_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :subject, limit: 255
    t.text :to_email_list
    t.timestamps
  end

  create_table :reso_showings, :force => true do |t|
    t.datetime :modification_timestamp
    t.datetime :original_entry_timestamp
    t.string :originating_system_showing_key, limit: 255
    t.datetime :showing_end_timestamp
    t.string :showing_id, limit: 255
    t.string :showing_key, limit: 255
    t.string :showing_key_numeric, limit: 255 # TODO: validates :showing_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :showing_originating_system_id, limit: 25
    t.string :showing_originating_system_name, limit: 255
    t.datetime :showing_requested_timestamp
    t.string :showing_source_system_id, limit: 25
    t.string :showing_source_system_name, limit: 255
    t.datetime :showing_start_timestamp
    t.string :source_system_showing_key, limit: 255
    t.timestamps
  end

  create_table :reso_showing_agents, :force => true do |t|
    t.integer :showing_id
    t.string :agent_originating_system_id, limit: 25
    t.string :agent_originating_system_name, limit: 255
    t.string :agent_source_system_id, limit: 25
    t.string :agent_source_system_name, limit: 255
    t.string :originating_system_agent_key, limit: 255
    t.string :showing_agent_key, limit: 255
    t.string :showing_agent_key_numeric, limit: 255 # TODO: validates :showing_agent_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :showing_agent_mls_id, limit: 25
    t.string :source_system_agent_key, limit: 255
    t.timestamps
  end

  create_table :reso_showing_listings, :force => true do |t|
    t.integer :showing_id
    t.string :listing_id, limit: 255
    t.string :listing_key, limit: 255
    t.string :listing_key_numeric, limit: 255 # TODO: validates :listing_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :listing_originating_system_id, limit: 25
    t.string :listing_originating_system_name, limit: 255
    t.string :listing_source_system_id, limit: 25
    t.string :listing_source_system_name, limit: 255
    t.string :originating_system_listing_key, limit: 255
    t.string :source_system_listing_key, limit: 255
    t.timestamps
  end

  create_table :reso_teams, :force => true do |t|
    t.datetime :modification_timestamp
    t.datetime :original_entry_timestamp
    t.string :originating_system_id, limit: 25
    t.string :originating_system_key, limit: 255
    t.string :originating_system_name, limit: 255
    t.text :social_media_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.text :social_media[type]url_or_id
    t.string :source_system_id, limit: 25
    t.string :source_system_key, limit: 255
    t.string :source_system_name, limit: 255
    t.string :team_address1, limit: 50
    t.string :team_address2, limit: 50
    t.string :team_carrier_route, limit: 9
    t.string :team_city, limit: 50
    t.text :team_country, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.text :team_county_or_parish, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :team_description
    t.string :team_direct_phone, limit: 16
    t.string :team_email, limit: 80
    t.string :team_fax, limit: 16
    t.string :team_key, limit: 255
    t.string :team_key_numeric, limit: 255 # TODO: validates :team_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :team_lead_key, limit: 255
    t.string :team_lead_key_numeric, limit: 255 # TODO: validates :team_lead_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :team_lead_login_id, limit: 25
    t.string :team_lead_mls_id, limit: 25
    t.string :team_lead_national_association_id, limit: 25
    t.string :team_lead_state_license, limit: 50
    t.text :team_lead_state_license_state, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.string :team_mobile_phone, limit: 16
    t.string :team_name, limit: 50
    t.string :team_office_phone, limit: 16
    t.string :team_office_phone_ext, limit: 10
    t.string :team_postal_code, limit: 10
    t.string :team_postal_code_plus4, limit: 4
    t.string :team_preferred_phone, limit: 16
    t.string :team_preferred_phone_ext, limit: 10
    t.text :team_state_or_province, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.text :team_status, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :team_toll_free_phone, limit: 16
    t.string :team_voice_mail, limit: 16
    t.string :team_voice_mail_ext, limit: 10
    t.string :teams_social_media # TODO: DELETE - Collection - has_many :through
    t.timestamps
  end

  create_table :reso_team_members, :force => true do |t|
    t.string :member_key, limit: 255
    t.string :member_key_numeric, limit: 255 # TODO: validates :member_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :member_login_id, limit: 25
    t.string :member_mls_id, limit: 25
    t.datetime :modification_timestamp
    t.datetime :original_entry_timestamp
    t.string :originating_system_id, limit: 25
    t.string :originating_system_key, limit: 255
    t.string :originating_system_name, limit: 255
    t.string :source_system_id, limit: 25
    t.string :source_system_key, limit: 255
    t.string :source_system_name, limit: 255
    t.text :team_impersonation_level, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :team_key, limit: 255
    t.string :team_key_numeric, limit: 255 # TODO: validates :team_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :team_member_key, limit: 255
    t.string :team_member_key_numeric, limit: 255 # TODO: validates :team_member_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :team_member_national_association_id, limit: 25
    t.string :team_member_state_license, limit: 50
    t.text :team_member_type, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.timestamps
  end

  create_table :reso_ouids, :force => true do |t|
    t.string :changed_by_member_id, limit: 25
    t.string :changed_by_member_key, limit: 255
    t.string :changed_by_member_key_numeric, limit: 255 # TODO: validates :changed_by_member_key_numeric, format: { with: /A[0-9]+z/ }
    t.datetime :modification_timestamp
    t.text :organization_aor, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :organization_address1, limit: 50
    t.string :organization_address2, limit: 50
    t.string :organization_aor_ouid, limit: 25
    t.string :organization_aor_ouid_key, limit: 255
    t.string :organization_aor_ouid_key_numeric, limit: 255 # TODO: validates :organization_aor_ouid_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :organization_carrier_route, limit: 9
    t.string :organization_city, limit: 50
    t.text :organization_comments
    t.string :organization_contact_email, limit: 80
    t.string :organization_contact_fax, limit: 16
    t.string :organization_contact_first_name, limit: 50
    t.string :organization_contact_full_name, limit: 150
    t.string :organization_contact_job_title, limit: 50
    t.string :organization_contact_last_name, limit: 50
    t.string :organization_contact_middle_name, limit: 50
    t.string :organization_contact_name_prefix, limit: 10
    t.string :organization_contact_name_suffix, limit: 10
    t.string :organization_contact_phone, limit: 16
    t.string :organization_contact_phone_ext, limit: 10
    t.text :organization_country, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.text :organization_county_or_parish, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :organization_member_count, limit: 14 # TODO: validates :organization_member_count, format: { with: /A[0-9]+z/ }
    t.string :organization_mls_code, limit: 25
    t.string :organization_mls_vendor_name, limit: 255
    t.string :organization_mls_vendor_ouid, limit: 25
    t.string :organization_name, limit: 255
    t.string :organization_national_association_id, limit: 25
    t.string :organization_postal_code, limit: 10
    t.string :organization_postal_code_plus4, limit: 4
    t.string :organization_social_media
    t.text :organization_social_media_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    # TODO: Handle dynamic fields - t.text :organization_social_media[type]url_or_id
    t.string :organization_state_license, limit: 50
    t.text :organization_state_license_state, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.text :organization_state_or_province, limit: 2 # TODO: DELETE - String List, Single - has_one :through
    t.boolean :organization_status
    t.datetime :organization_status_change_timestamp
    t.text :organization_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :organization_unique_id, limit: 25
    t.string :organization_unique_id_key, limit: 255
    t.string :organization_unique_id_key_numeric, limit: 255 # TODO: validates :organization_unique_id_key_numeric, format: { with: /A[0-9]+z/ }
    t.datetime :original_entry_timestamp
    t.timestamps
  end

  create_table :reso_contact_listing_notes, :force => true do |t|
    t.string :contact_key, limit: 255
    t.string :contact_key_numeric, limit: 255 # TODO: validates :contact_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :contact_listing_notes_key, limit: 255
    t.string :contact_listing_notes_key_numeric, limit: 255 # TODO: validates :contact_listing_notes_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :listing_id, limit: 255
    t.string :listing_key, limit: 255
    t.string :listing_key_numeric, limit: 255 # TODO: validates :listing_key_numeric, format: { with: /A[0-9]+z/ }
    t.datetime :modification_timestamp
    t.text :note_contents
    t.text :noted_by, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.timestamps
  end

  create_table :reso_other_phones, :force => true do |t|
    t.text :class_name, limit: 255 # TODO: DELETE - String List, Single - has_one :through
    t.datetime :modification_timestamp
    t.string :other_phone_ext, limit: 10
    t.string :other_phone_key, limit: 255
    t.string :other_phone_key_numeric, limit: 255 # TODO: validates :other_phone_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :other_phone_number, limit: 16
    t.text :other_phone_type, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :resource_name, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :resource_record_id, limit: 255
    t.string :resource_record_key, limit: 255
    t.string :resource_record_key_numeric, limit: 255 # TODO: validates :resource_record_key_numeric, format: { with: /A[0-9]+z/ }
    t.timestamps
  end

  create_table :reso_property_green_verifications, :force => true do |t|
    t.string :green_building_verification_key, limit: 255
    t.string :green_building_verification_key_numeric, limit: 255 # TODO: validates :green_building_verification_key_numeric, format: { with: /A[0-9]+z/ }
    t.text :green_building_verification_type, limit: 1024 # TODO: DELETE - String List, Single - has_one :through
    t.string :green_verification_body, limit: 50
    t.integer :green_verification_metric # TODO: verify length of .to_s to max 3
    t.string :green_verification_rating, limit: 50
    t.text :green_verification_source, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :green_verification_status, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :green_verification_url
    t.string :green_verification_version, limit: 25
    t.integer :green_verification_year # TODO: verify length of .to_s to max 4
    t.string :listing_id, limit: 255
    t.string :listing_key, limit: 255
    t.string :listing_key_numeric, limit: 255 # TODO: validates :listing_key_numeric, format: { with: /A[0-9]+z/ }
    t.datetime :modification_timestamp
    t.timestamps
  end

  create_table :reso_property_power_productions, :force => true do |t|
    t.string :listing_id, limit: 255
    t.string :listing_key, limit: 255
    t.string :listing_key_numeric, limit: 255 # TODO: validates :listing_key_numeric, format: { with: /A[0-9]+z/ }
    t.datetime :modification_timestamp
    t.integer :power_production_annual # TODO: verify length of .to_s to max 6
    t.text :power_production_annual_status, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.string :power_production_key, limit: 255
    t.string :power_production_key_numeric, limit: 255 # TODO: validates :power_production_key_numeric, format: { with: /A[0-9]+z/ }
    t.decimal :power_production_size, limit: 5, precision: 2
    t.text :power_production_type, limit: 1024 # TODO: DELETE - String List, Single - has_one :through
    t.integer :power_production_year_install # TODO: verify length of .to_s to max 4
    t.timestamps
  end

  create_table :reso_property_rooms, :force => true do |t|
    t.string :listing_id, limit: 255
    t.string :listing_key, limit: 255
    t.string :listing_key_numeric, limit: 255 # TODO: validates :listing_key_numeric, format: { with: /A[0-9]+z/ }
    t.datetime :modification_timestamp
    t.decimal :room_area, limit: 14, precision: 2
    t.text :room_area_source, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :room_area_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :room_description
    t.string :room_dimensions, limit: 50
    t.text :room_features, limit: 1024 # TODO: DELETE - String List, Multi - has_many :through
    t.string :room_key, limit: 255
    t.string :room_key_numeric, limit: 255 # TODO: validates :room_key_numeric, format: { with: /A[0-9]+z/ }
    t.decimal :room_length, limit: 14, precision: 2
    t.text :room_length_width_source, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :room_length_width_units, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :room_level, limit: 25 # TODO: DELETE - String List, Single - has_one :through
    t.text :room_type, limit: 1024 # TODO: DELETE - String List, Single - has_one :through
    t.decimal :room_width, limit: 14, precision: 2
    t.timestamps
  end
  
#  Reso::PropertyUnitType Fields
#    t.string :listing_id, limit: 255
#    t.string :listing_key, limit: 255
#    t.string :listing_key_numeric, limit: 255 # TODO: validates :listing_key_numeric, format: { with: /A[0-9]+z/ }
#    t.datetime :modification_timestamp
#    t.decimal :unit_type_actual_rent, limit: 14, precision: 2
#    t.integer :unit_type_baths_total # TODO: verify length of .to_s to max 3
#    t.integer :unit_type_beds_total # TODO: verify length of .to_s to max 3
#    t.text :unit_type_description
#    t.text :unit_type_furnished, limit: 20 # TODO: DELETE - String List, Single - has_one :through
#    t.boolean :unit_type_garage_attached_yn
#    t.decimal :unit_type_garage_spaces, limit: 14, precision: 2
#    t.string :unit_type_key, limit: 255
#    t.string :unit_type_key_numeric, limit: 255 # TODO: validates :unit_type_key_numeric, format: { with: /A[0-9]+z/ }
#    t.integer :unit_type_pro_forma # TODO: verify length of .to_s to max 6
#    t.decimal :unit_type_total_rent, limit: 14, precision: 2
#    t.text :unit_type_type, limit: 1024 # TODO: DELETE - String List, Single - has_one :through
#    t.integer :unit_type_units_total # TODO: verify length of .to_s to max 3

  create_table :reso_social_media, :force => true do |t|
    t.text :class_name, limit: 255 # TODO: DELETE - String List, Single - has_one :through
    t.datetime :modification_timestamp
    t.text :resource_name, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.string :resource_record_id, limit: 255
    t.string :resource_record_key, limit: 255
    t.string :resource_record_key_numeric, limit: 255 # TODO: validates :resource_record_key_numeric, format: { with: /A[0-9]+z/ }
    t.string :social_media_key, limit: 255
    t.string :social_media_key_numeric, limit: 255 # TODO: validates :social_media_key_numeric, format: { with: /A[0-9]+z/ }
    t.text :social_media_type, limit: 50 # TODO: DELETE - String List, Single - has_one :through
    t.text :social_media_url_or_id
    t.timestamps
  end

end
