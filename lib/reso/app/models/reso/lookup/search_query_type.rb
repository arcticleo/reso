class RESO::Lookup::SearchQueryType < RESO::Enumeration
  has_one :search_query_type_assignment, foreign_key: :enumeration_id
  has_one :reso_saved_search, through: :search_query_type_assignment, source: :enumerable, source_type: "RESO::SavedSearch"
end
