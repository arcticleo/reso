class RESO::Property::Location < ApplicationRecord
  belongs_to :property
  has_one :address, dependent: :destroy
  has_one :area, dependent: :destroy
  has_one :gis, dependent: :destroy
  has_one :school, dependent: :destroy
end
