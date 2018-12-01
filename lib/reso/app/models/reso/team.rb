class Reso::Team < ApplicationRecord
  self.table_name = 'reso_teams'

  has_one :team_status_assignment, as: :enumerable
  has_one :team_status, through: :team_status_assignment, source: :enumeration, class_name: "Reso::Lookup::TeamStatus"

end
