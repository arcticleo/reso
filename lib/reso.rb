require "reso/version"
require "reso/railtie" if defined?(Rails)
require "reso/app/models/reso/data_dictionary.rb"
require "reso/app/models/reso/data_dictionary/specification.rb"

module Reso
  class Error < StandardError; end
  # Your code goes here...
end
