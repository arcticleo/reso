class RESO::Lookup::QueueTransactionType < RESO::Enumeration
  has_one :queue_transaction_type_assignment, foreign_key: :enumeration_id
  has_one :reso_queue, through: :queue_transaction_type_assignment, source: :enumerable, source_type: "RESO::Queue"
end
