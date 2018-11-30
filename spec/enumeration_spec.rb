require 'nokogiri'
require 'open-uri'

RSpec.describe "Lookup Fields" do
#  VIEWS = %w(Beach City Forest Ocean Panoramic Skyline)
#  VIEWS.each{|name| Reso::Lookup::View.create(name: name)}

#  PROPERTY_SUB_TYPES = ["Apartment", "Condominium", "Farm", "Ranch", "Single Family Residence"]
#  PROPERTY_TYPES = ["Residential", "Farm", "Land"]
#  PROPERTY_SUB_TYPES.each{|name| Reso::Lookup::PropertySubType.create(name: name)}

#  it "can add Reso::Lookup::PropertySubType" do
#    expect{PROPERTY_SUB_TYPES.each{|name| Reso::Lookup::PropertySubType.create(name: name)}}.not_to raise_error
#  end

#  it "can add Reso::Lookup::PropertyType" do
#    expect{PROPERTY_TYPES.each{|name| Reso::Lookup::PropertyType.create(name: name)}}.to raise_error
#  end

  Reso::DataDictionary::specification.lookup_fields.each do |lookup_field|
    it "#{lookup_field} can be initialized" do
      expect{lookup_field.constantize.new}.not_to raise_error
    end
  end

end


