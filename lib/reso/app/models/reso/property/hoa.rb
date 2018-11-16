class Reso::Property::HOA < ApplicationRecord
  self.table_name = 'reso_property_hoas'

  belongs_to :property

end
