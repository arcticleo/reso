class Reso::InternetTracking::Object < ApplicationRecord
  self.table_name = 'reso_internet_tracking_objects'
  
  belongs_to :internet_tracking

end
