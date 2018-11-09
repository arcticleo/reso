require "reso/version"
require "reso/railtie" if defined?(Rails)
require "reso/app/models/reso/data_dictionary.rb"

module Reso
  class Error < StandardError; end
  # Your code goes here...
end
