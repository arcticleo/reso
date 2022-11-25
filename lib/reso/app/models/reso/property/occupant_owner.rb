class RESO::Property::OccupantOwner < ApplicationRecord
  belongs_to :property
  
  has_one :reso_occupant_type_assignment, as: :parent, class_name: "OccupantTypeAssignment", dependent: :destroy
  has_one :occupant_type,
    through: :reso_occupant_type_assignment,
    source_type: "RESO::Enumeration",
    source: :child

  def occupant_type=(value)
    enum = RESO::OccupantType.lookup_enum(value)
    RESO::OccupantTypeAssignment.single_assignment(parent: self, child: enum) unless enum.blank?
  end
  
end
