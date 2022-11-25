class RESO::Property::Listing::Price < ApplicationRecord
  belongs_to :listing

  after_create :update_original_list_price
  before_save :update_previous_list_price
  
  def update_original_list_price
    if self.original_list_price.blank?
      self.update_attribute(:original_list_price, self.list_price)
    end
  end
  
  def update_previous_list_price
    if self.list_price_changed? && !self.previous_list_price_changed?
      self.previous_list_price = self.list_price_was unless self.list_price_was.blank?
    end
  end

end
