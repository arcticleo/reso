class RESO::InternetTracking::Actor < ApplicationRecord
  self.table_name = 'reso_internet_tracking_actors'
  
  belongs_to :internet_tracking

end
