class RESO::Lookup::GreenEnergyGeneration < RESO::Enumeration
  has_many :green_energy_generation_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structure_performance_green_marketings, through: :green_energy_energy_assignments, source: :enumerable, source_type: "RESO::Property::Structure::Performance::GreenMarketing"
end