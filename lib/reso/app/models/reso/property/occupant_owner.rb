class RESO::Property::OccupantOwner < ApplicationRecord
  self.table_name = 'reso_property_occupant_owners'

  belongs_to :property

end
