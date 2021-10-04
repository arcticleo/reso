class RESO::Lookup::GreenBuildingVerificationType < RESO::Enumeration
  has_many :green_building_verification_type_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structure_performance_green_verifications, through: :green_building_verification_type_assignments, source: :enumerable, source_type: "RESO::Property::Structure::Performance::GreenVerification"
end
