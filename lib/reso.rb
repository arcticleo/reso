require "reso/version"
require "reso/railtie" if defined?(Rails)
require "reso/config/inflections.rb"
require "reso/app/models/reso/data_dictionary.rb"
require "reso/app/models/reso/data_dictionary/property.rb"
require "reso/app/models/reso/data_dictionary/member.rb"
require "reso/app/models/reso/data_dictionary/office.rb"
require "reso/app/models/reso/data_dictionary/contact.rb"
require "reso/app/models/reso/data_dictionary/contact_listing.rb"
require "reso/app/models/reso/data_dictionary/media.rb"
require "reso/app/models/reso/data_dictionary/history_transactional.rb"
require "reso/app/models/reso/data_dictionary/internet_tracking.rb"
require "reso/app/models/reso/data_dictionary/saved_search.rb"
require "reso/app/models/reso/data_dictionary/open_house.rb"
require "reso/app/models/reso/data_dictionary/prospecting.rb"
require "reso/app/models/reso/data_dictionary/showing.rb"
require "reso/app/models/reso/data_dictionary/team.rb"
require "reso/app/models/reso/data_dictionary/team_member.rb"
require "reso/app/models/reso/data_dictionary/ouid.rb"
require "reso/app/models/reso/data_dictionary/contact_listing_note.rb"
require "reso/app/models/reso/data_dictionary/other_phone.rb"
require "reso/app/models/reso/data_dictionary/property_green_verification.rb"
require "reso/app/models/reso/data_dictionary/property_power_production.rb"
require "reso/app/models/reso/data_dictionary/property_room.rb"
require "reso/app/models/reso/data_dictionary/property_unit_type.rb"
require "reso/app/models/reso/data_dictionary/social_media.rb"

module Reso
  class Error < StandardError; end
  # Your code goes here...
end
