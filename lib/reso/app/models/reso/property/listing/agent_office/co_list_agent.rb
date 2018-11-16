class Reso::Property::Listing::AgentOffice::CoListAgent < ApplicationRecord
  self.table_name = 'reso_property_listing_agent_office_co_list_agents'

  belongs_to :agent_office

end
