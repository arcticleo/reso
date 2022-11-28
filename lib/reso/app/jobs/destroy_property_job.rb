class DestroyPropertyJob < ActiveJob::Base
  queue_as :reso_destroy

  def perform(property)
    property.try(:destroy)
  end
end
