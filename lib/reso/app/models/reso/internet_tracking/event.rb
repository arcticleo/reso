class Reso::InternetTracking::Event < ApplicationRecord
  self.table_name = 'reso_internet_tracking_events'
  
  belongs_to :internet_tracking

end
