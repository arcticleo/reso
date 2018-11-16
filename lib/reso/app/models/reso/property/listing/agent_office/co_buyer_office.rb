class Reso::Property::Listing::AgentOffice::CoBuyerOffice < ApplicationRecord
  self.table_name = 'reso_property_listing_agent_office_co_buyer_offices'

  belongs_to :agent_office

end
