class Reso::Property::Financial < ApplicationRecord
  self.table_name = 'reso_property_financials'

  belongs_to :property

end
