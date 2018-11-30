class Reso::Property::Farming < ApplicationRecord
  self.table_name = 'reso_property_farmings'

  belongs_to :property

  has_many :vegetation_assignments, as: :enumerable
  has_many :vegetation, through: :vegetation_assignments, source: :enumeration, class_name: "Reso::Lookup::Vegetation"

end
