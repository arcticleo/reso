class Reso::Property::Structure::Performance::GreenVerification < ApplicationRecord
  self.table_name = 'reso_property_structure_performance_green_verifications'

  belongs_to :performance

end
