class Reso::Property::Farming < ApplicationRecord
  self.table_name = 'reso_property_farmings'

  belongs_to :property

end
