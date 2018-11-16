class Reso::Property::Listing::AgentOffice::BuyerOffice < ApplicationRecord
  self.table_name = 'reso_property_listing_agent_office_buyer_offices'

  belongs_to :agent_office

end
