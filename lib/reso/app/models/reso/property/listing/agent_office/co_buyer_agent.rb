class Reso::Property::Listing::AgentOffice::CoBuyerAgent < ApplicationRecord
  self.table_name = 'reso_property_listing_agent_office_co_buyer_agents'

  belongs_to :agent_office

end
