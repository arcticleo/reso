class RESO::Lookup::RuleFormat < RESO::Enumeration
  has_one :rule_format_assignment, foreign_key: :enumeration_id
  has_one :reso_rule, through: :rule_format_assignment, source: :enumerable, source_type: "RESO::Rule"
end
