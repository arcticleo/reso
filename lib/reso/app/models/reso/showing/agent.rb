class Reso::Showing::Agent < ApplicationRecord
  self.table_name = 'reso_showing_agents'

  belongs_to :showing

end
