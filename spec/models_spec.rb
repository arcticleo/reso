require 'nokogiri'
require 'open-uri'

RSpec.describe "Data classes" do
  Reso::DataDictionary.specification.resources.each do |resource|
    it "#{resource} can be initialized" do
      expect(resource.constantize.new).to be_a(resource.constantize)
    end
  end
end

Reso::DataDictionary.specification.resources.each do |resource|
  RSpec.describe "#{resource} attributes" do
    Reso::DataDictionary.specification.fields_for_class(resource).map{|f| f[:attribute_name]}.each do |attr|
      it attr do
      end
    end
  end
end

