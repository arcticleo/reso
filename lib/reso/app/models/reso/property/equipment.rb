class RESO::Property::Equipment < ApplicationRecord
  belongs_to :property

  has_many :reso_appliance_assignments, as: :parent, class_name: "ApplianceAssignment", dependent: :destroy
  has_many :appliances,
    through: :reso_appliance_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_other_equipment_assignments, as: :parent, class_name: "OtherEquipmentAssignment", dependent: :destroy
  has_many :other_equipment,
    through: :reso_other_equipment_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  has_many :reso_security_feature_assignments, as: :parent, class_name: "SecurityFeatureAssignment", dependent: :destroy
  has_many :security_features,
    through: :reso_security_feature_assignments,
    source_type: "RESO::Enumeration",
    source: :child

  def appliances=(values)
    enums = RESO::Appliance.lookup_enums(values)
    RESO::ApplianceAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def other_equipment=(values)
    enums = RESO::OtherEquipment.lookup_enums(values)
    RESO::OtherEquipmentAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

  def security_features=(values)
    enums = RESO::SecurityFeature.lookup_enums(values)
    RESO::SecurityFeatureAssignment.multi_assignment(parent: self, children: enums) unless enums.blank?
  end

end
