class RESO::Lookup::CoListAgentDesignation < RESO::Enumeration
  has_many :co_list_agent_designation_assignments, foreign_key: :enumeration_id
  has_many :reso_property_listing_agent_office_co_list_agent, through: :co_list_agent_designation_assignments, source: :enumerable, source_type: "RESO::Property::Listing::AgentOffice::CoListAgent"
end
