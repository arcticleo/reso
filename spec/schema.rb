ActiveRecord::Schema.define do
  self.verbose = false

  create_table :reso_properties, :force => true do |t|
    t.string :name
  end

  create_table :reso_property_equipment, :force => true do |t|
    t.string :name
    t.integer :property_id
  end


  create_table :reso_property_businesses, :force => true do |t|
    t.integer :property_id
  end

  create_table :reso_property_characteristics, :force => true do |t|
    t.integer :property_id
  end

  create_table :reso_property_farmings, :force => true do |t|
    t.integer :property_id
  end

  create_table :reso_property_financials, :force => true do |t|
    t.integer :property_id
  end

  create_table :reso_property_hoas, :force => true do |t|
    t.integer :property_id
  end

  create_table :reso_property_listings, :force => true do |t|
    t.integer :property_id
  end

  create_table :reso_property_listing_agent_offices, :force => true do |t|
    t.integer :listing_id
  end

  create_table :reso_property_listing_agent_office_buyer_agents, :force => true do |t|
    t.integer :agent_office_id
  end

  create_table :reso_property_listing_agent_office_buyer_offices, :force => true do |t|
    t.integer :agent_office_id
  end

  create_table :reso_property_listing_agent_office_co_buyer_agents, :force => true do |t|
    t.integer :agent_office_id
  end

  create_table :reso_property_listing_agent_office_co_buyer_offices, :force => true do |t|
    t.integer :agent_office_id
  end

  create_table :reso_property_listing_agent_office_co_list_agents, :force => true do |t|
    t.integer :agent_office_id
  end

  create_table :reso_property_listing_agent_office_co_list_offices, :force => true do |t|
    t.integer :agent_office_id
  end

  create_table :reso_property_listing_agent_office_list_agents, :force => true do |t|
    t.integer :agent_office_id
  end

  create_table :reso_property_listing_agent_office_list_offices, :force => true do |t|
    t.integer :agent_office_id
  end

  create_table :reso_property_listing_agent_office_teams, :force => true do |t|
    t.integer :agent_office_id
  end

  create_table :reso_property_listing_closings, :force => true do |t|
    t.integer :listing_id
  end

  create_table :reso_property_listing_compensations, :force => true do |t|
    t.integer :listing_id
  end

  create_table :reso_property_listing_contracts, :force => true do |t|
    t.integer :listing_id
  end

  create_table :reso_property_listing_dates, :force => true do |t|
    t.integer :listing_id
  end

  create_table :reso_property_listing_marketings, :force => true do |t|
    t.integer :listing_id
  end

  create_table :reso_property_listing_media, :force => true do |t|
    t.integer :listing_id
  end

  create_table :reso_property_listing_prices, :force => true do |t|
    t.integer :listing_id
  end

  create_table :reso_property_listing_remarks, :force => true do |t|
    t.integer :listing_id
  end

  create_table :reso_property_listing_showings, :force => true do |t|
    t.integer :listing_id
  end

  create_table :reso_property_locations, :force => true do |t|
    t.integer :property_id
  end

  create_table :reso_property_location_addresses, :force => true do |t|
    t.integer :location_id
  end

  create_table :reso_property_location_areas, :force => true do |t|
    t.integer :location_id
  end

  create_table :reso_property_location_gis, :force => true do |t|
    t.integer :location_id
  end

  create_table :reso_property_location_schools, :force => true do |t|
    t.integer :location_id
  end

  create_table :reso_property_occupant_owners, :force => true do |t|
    t.integer :property_id
  end

  create_table :reso_property_structures, :force => true do |t|
    t.integer :property_id
  end

  create_table :reso_property_structure_performance_green_marketings, :force => true do |t|
    t.integer :performance_id
  end

  create_table :reso_property_structure_performances, :force => true do |t|
    t.integer :structure_id
  end

  create_table :reso_property_structure_performance_green_verifications, :force => true do |t|
    t.integer :performance_id
  end

  create_table :reso_property_structure_rooms, :force => true do |t|
    t.integer :structure_id
  end

  create_table :reso_property_taxes, :force => true do |t|
    t.integer :property_id
  end

  create_table :reso_property_unit_types, :force => true do |t|
    t.integer :property_id
  end

  create_table :reso_property_utilities, :force => true do |t|
    t.integer :property_id
  end

  create_table :reso_members, :force => true do |t|
  end

  create_table :reso_offices, :force => true do |t|
  end

  create_table :reso_contacts, :force => true do |t|
  end

  create_table :reso_contact_listings, :force => true do |t|
  end

  create_table :reso_media, :force => true do |t|
  end

  create_table :reso_history_transactionals, :force => true do |t|
  end

  create_table :reso_internet_trackings, :force => true do |t|
  end

  create_table :reso_internet_tracking_actors, :force => true do |t|
    t.integer :internet_tracking_id
  end

  create_table :reso_internet_tracking_events, :force => true do |t|
    t.integer :internet_tracking_id
  end

  create_table :reso_internet_tracking_objects, :force => true do |t|
    t.integer :internet_tracking_id
  end

  create_table :reso_saved_searches, :force => true do |t|
  end

  create_table :reso_open_houses, :force => true do |t|
  end

  create_table :reso_prospectings, :force => true do |t|
  end

  create_table :reso_showings, :force => true do |t|
  end

  create_table :reso_showing_agents, :force => true do |t|
    t.integer :showing_id
  end

  create_table :reso_showing_listings, :force => true do |t|
    t.integer :showing_id
  end

  create_table :reso_teams, :force => true do |t|
  end

  create_table :reso_team_members, :force => true do |t|
  end

  create_table :reso_ouids, :force => true do |t|
  end

  create_table :reso_contact_listing_notes, :force => true do |t|
  end

  create_table :reso_other_phones, :force => true do |t|
  end

  create_table :reso_property_green_verifications, :force => true do |t|
  end

  create_table :reso_property_power_productions, :force => true do |t|
  end

  create_table :reso_property_rooms, :force => true do |t|
  end

  create_table :reso_social_media, :force => true do |t|
  end

end
