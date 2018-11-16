class Reso::Showing::Listing < ApplicationRecord
  self.table_name = 'reso_showing_listings'

  belongs_to :showing

end
