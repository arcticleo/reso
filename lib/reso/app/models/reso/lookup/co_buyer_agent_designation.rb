class RESO::Lookup::CoBuyerAgentDesignation < RESO::Enumeration
  has_many :co_buyer_agent_designation_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_agent_office_co_buyer_agent, through: :co_buyer_agent_designation_assignments, source: :enumerable, source_type: "RESO::Property::Listing::AgentOffice::CoBuyerAgent"
end
