class Reso::Property::Utility < ApplicationRecord
  self.table_name = 'reso_property_utilities'

  belongs_to :property

end
