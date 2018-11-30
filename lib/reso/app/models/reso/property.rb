class Reso::Property < ApplicationRecord

  self.table_name = 'reso_properties'

  has_one :property_sub_type_assignment, as: :enumerable
  has_one :property_sub_type, through: :property_sub_type_assignment, source: :enumeration, class_name: "Reso::Lookup::PropertySubType"

  has_one :business
  has_one :characteristic
  has_one :equipment
  has_one :farming
  has_one :financial
  has_one :hoa, class_name: "HOA"
  has_one :location
  has_one :listing
  has_one :occupant_owner
  has_one :structure
  has_one :tax
  has_one :unit_type
  has_one :utility

end
