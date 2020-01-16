class RESO::Lookup::ChangeType < RESO::Enumeration
  has_many :change_type_assignments, foreign_key: :enumeration_id
  has_many :reso_history_transactionals, through: :change_type_assignments, source: :enumerable, source_type: "RESO::HistoryTransactional"
  has_many :reso_property_listing_dates, through: :change_type_assignments, source: :enumerable, source_type: "RESO::Property::Listing::Date"
end
