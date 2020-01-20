class RESO::Lookup::ListAgentDesignation < RESO::Enumeration
  has_many :list_agent_designation_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_agent_office_list_agents, through: :list_agent_designation_assignments, source: :enumerable, source_type: "RESO::Property::Listing::AgentOffice::ListAgent"
end
