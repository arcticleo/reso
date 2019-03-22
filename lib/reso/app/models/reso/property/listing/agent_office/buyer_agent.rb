class RESO::Property::Listing::AgentOffice::BuyerAgent < ApplicationRecord
  self.table_name = 'reso_property_listing_agent_office_buyer_agents'

  belongs_to :agent_office

end
