class Reso::Property::Structure::Room < ApplicationRecord
  self.table_name = 'reso_property_structure_rooms'

  belongs_to :structure

end
