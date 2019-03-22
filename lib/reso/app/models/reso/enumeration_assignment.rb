class RESO::EnumerationAssignment < ApplicationRecord
  belongs_to :enumeration
  belongs_to :enumerable, polymorphic: true
end
