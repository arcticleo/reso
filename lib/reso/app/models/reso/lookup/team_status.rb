class Reso::Lookup::TeamStatus < Reso::Enumeration
  has_many :team_status_assignments, foreign_key: :enumeration_id
  has_many :reso_teams, through: :team_status_assignments, source: :enumerable, source_type: "Reso::Property::TeamStatus"
end
