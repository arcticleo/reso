class RESO::Lookup::GreenEnergyEfficient < RESO::Enumeration
  has_many :green_energy_efficient_assignments, foreign_key: :enumeration_id
  has_many :reso_property_structure_performance_green_marketings, through: :green_energy_efficient_assignments, source: :enumerable, source_type: "RESO::Property::Structure::Performance::GreenMarketing"
end
