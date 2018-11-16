class Reso::Property::Listing::AgentOffice::ListAgent < ApplicationRecord
  self.table_name = 'reso_property_listing_agent_office_list_agents'

  belongs_to :agent_office

end
