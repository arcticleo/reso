class Reso::Property::Structure::Performance < ApplicationRecord

  belongs_to :structure

  has_one :green_marketing
  has_one :green_verification
end
