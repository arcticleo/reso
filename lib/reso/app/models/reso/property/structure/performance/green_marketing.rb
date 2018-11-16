class Reso::Property::Structure::Performance::GreenMarketing < ApplicationRecord
  self.table_name = 'reso_property_structure_performance_green_marketings'

  belongs_to :performance

end
