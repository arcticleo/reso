require 'nokogiri'
require 'open-uri'

RSpec.describe "Data Models" do

  Reso::DataDictionary.specification.resources.each do |resource|
    it "#{resource} can be initialized" do
      expect(resource.constantize.new).to be_a(resource.constantize)
    end
  end

end

