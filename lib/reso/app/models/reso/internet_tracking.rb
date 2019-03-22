class RESO::InternetTracking < ApplicationRecord
  self.table_name = 'reso_internet_trackings'

  has_one :actor
  has_one :event
  has_one :object
end
