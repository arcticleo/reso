class Reso::Property::Listing::AgentOffice < ApplicationRecord
  self.table_name = 'reso_property_listing_agent_offices'

  belongs_to :listing

  has_one :buyer_agent
  has_one :buyer_office
  has_one :co_buyer_agent
  has_one :co_buyer_office
  has_one :co_list_agent
  has_one :co_list_office
  has_one :list_agent
  has_one :list_office
  has_one :team
end
