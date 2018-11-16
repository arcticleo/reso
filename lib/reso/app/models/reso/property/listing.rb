class Reso::Property::Listing < ApplicationRecord
  self.table_name = 'reso_property_listings'

  belongs_to :property

  has_one :agent_office
  has_one :closing
  has_one :compensation
  has_one :contract
  has_one :date
  has_one :marketing
  has_one :media
  has_one :price
  has_one :remark
  has_one :showing
  
end
