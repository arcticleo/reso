class Reso::Property::Listing::AgentOffice::CoListOffice < ApplicationRecord
  self.table_name = 'reso_property_listing_agent_office_co_list_offices'

  belongs_to :agent_office

end
