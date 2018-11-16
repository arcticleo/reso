class Reso::Property::Characteristic < ApplicationRecord
  self.table_name = 'reso_property_characteristics'

  belongs_to :property

end
