class RESO::Property::Listing::AgentOffice::Team < ApplicationRecord
  self.table_name = 'reso_property_listing_agent_office_teams'

  belongs_to :agent_office

end
