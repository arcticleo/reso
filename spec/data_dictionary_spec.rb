require 'nokogiri'
require 'open-uri'

RSpec.describe "Enumerations" do
#  VIEWS = %w(Beach City Forest Ocean Panoramic Skyline)
#  VIEWS.each{|name| Reso::Lookup::View.create(name: name)}

  PROPERTY_SUB_TYPES = ["Apartment", "Condominium", "Farm", "Ranch", "Single Family Residence"]
  PROPERTY_TYPES = ["Residential", "Farm", "Land"]
  PROPERTY_SUB_TYPES.each{|name| Reso::Lookup::PropertySubType.create(name: name)}

  it "can add Reso::Lookup::PropertySubType" do
    expect{PROPERTY_SUB_TYPES.each{|name| Reso::Lookup::PropertySubType.create(name: name)}}.not_to raise_error
  end

  it "can add Reso::Lookup::PropertyType" do
    expect{PROPERTY_TYPES.each{|name| Reso::Lookup::PropertyType.create(name: name)}}.to raise_error
  end
end

RSpec.describe Reso::DataDictionary do

  it "can be accessed through singleton" do
    expect(Reso::DataDictionary.specification).to be_a(Reso::DataDictionary)
  end

  it "cannot initialize instance" do
    expect{Reso::DataDictionary.new}.to raise_error(NoMethodError)
  end

  it "includes xml_path method" do
    expect(Reso::DataDictionary.specification.methods.include? :xml_path).to be_truthy
  end

  it "xml_path returns string" do
    expect(Reso::DataDictionary.specification.xml_path).to be_a(String)
  end

  it "can access file at xml_path" do
    expect(File.exist?(Reso::DataDictionary.specification.xml_path)).to be_truthy
  end

  it "includes xml_doc method" do
    expect(Reso::DataDictionary.specification.methods.include? :xml_doc).to be_truthy
  end

  it "xml_doc returns Nokogiri XML document" do
    expect(Reso::DataDictionary.specification.xml_doc).to be_a(Nokogiri::XML::Document)
  end

  it "includes method resources" do
    expect(Reso::DataDictionary.specification.methods.include? :resources).to be_truthy
  end

  it "resources returns array" do
    expect(Reso::DataDictionary.specification.resources).to be_a(Array)
  end

end

