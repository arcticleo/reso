class RESO::Lookup::BuyerAgentDesignation < RESO::Enumeration
  has_many :buyer_agent_designation_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_agent_office_buyer_agents, through: :buyer_agent_designation_assignments, source: :enumerable, source_type: "RESO::Property::Listing::AgentOffice::BuyerAgent"
end

