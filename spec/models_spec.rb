require 'nokogiri'
require 'open-uri'

RSpec.describe "Data classes" do
  Reso::DataDictionary.specification.resources.each do |resource|
    it "#{resource} can be initialized" do
      expect(resource.constantize.new).to be_a(resource.constantize)
    end

    res_arr = "Reso::Property::Location::School".split("::")
    (0..res_arr.count-3).each do |index|
      parent_arr = res_arr[0..index + 1]
      child_arr = res_arr[0..index + 2]
      parent = parent_arr.join("::").constantize.new
      child = child_arr.join("::").constantize.new
      parent.assign_attributes(child_arr.last.underscore.to_sym => child)

      it "#{parent_arr.join("::")} => #{child_arr.join("::")}" do
        expect(parent.send(child_arr.last.underscore.to_sym)).to be_a(child_arr.join("::").constantize)
      end
    end

  end

end

# Reso::DataDictionary.specification.resources.each do |resource|
#   RSpec.describe "#{resource} attributes" do
#     Reso::DataDictionary.specification.fields_for_class(resource).map{|f| f[:attribute_name]}.each do |attr|
#       it attr do
#       end
#     end
#   end
# end
