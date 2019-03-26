require 'nokogiri'
require 'open-uri'

RSpec.describe RESO::DataDictionary do

  it "can be accessed through singleton" do
    expect(RESO::DataDictionary.specification).to be_a(RESO::DataDictionary)
  end

  it "cannot initialize instance" do
    expect{RESO::DataDictionary.new}.to raise_error(NoMethodError)
  end

  it "includes xml_path method" do
    expect(RESO::DataDictionary.specification.methods.include? :xml_path).to be_truthy
  end

  it "xml_path returns string" do
    expect(RESO::DataDictionary.specification.xml_path).to be_a(String)
  end

  it "can access file at xml_path" do
    expect(File.exist?(RESO::DataDictionary.specification.xml_path)).to be_truthy
  end

  it "includes xml_doc method" do
    expect(RESO::DataDictionary.specification.methods.include? :xml_doc).to be_truthy
  end

  it "xml_doc returns Nokogiri XML document" do
    expect(RESO::DataDictionary.specification.xml_doc).to be_a(Nokogiri::XML::Document)
  end

  it "includes method resources" do
    expect(RESO::DataDictionary.specification.methods.include? :resources).to be_truthy
  end

  it "resources returns array" do
    expect(RESO::DataDictionary.specification.resources).to be_a(Array)
  end

end

