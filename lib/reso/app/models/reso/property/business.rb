class RESO::Property::Business < ApplicationRecord
  self.table_name = 'reso_property_businesses'

  belongs_to :property

end
