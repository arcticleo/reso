class ImportPropertyJob < ActiveJob::Base
  queue_as :reso_import

  def perform(property)
    begin
      property.import_property_steps
    rescue ActiveRecord::RecordNotFound => e
      puts e
    end
  end
end
