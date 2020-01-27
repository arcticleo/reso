class RESO::Lookup::PropertyCondition < RESO::Enumeration
  has_many :property_condition_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structures, through: :property_condition_assignments, source: :enumerable, source_type: "RESO::Property::Structure"
end
