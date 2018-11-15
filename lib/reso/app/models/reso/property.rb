class Reso::Property < ApplicationRecord

  self.table_name = 'reso_properties'

  has_one :equipment

end
