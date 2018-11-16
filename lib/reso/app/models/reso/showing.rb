class Reso::Showing < ApplicationRecord
  self.table_name = 'reso_showings'
  
  has_one :agent
  has_one :listing

end
