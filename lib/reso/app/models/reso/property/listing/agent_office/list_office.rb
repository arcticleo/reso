class Reso::Property::Listing::AgentOffice::ListOffice < ApplicationRecord
  self.table_name = 'reso_property_listing_agent_office_list_offices'

  belongs_to :agent_office

end
