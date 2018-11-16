require 'nokogiri'
require 'open-uri'

RSpec.describe "Data classes" do
  Reso::DataDictionary.specification.resources.each do |resource|
    it "#{resource} can be initialized" do
      expect(resource.constantize.new).to be_a(resource.constantize)
    end

    res_arr = resource.split("::")
    if res_arr.count > 2
      it "#{res_arr.join(" -> ")} relationships" do
        (0..res_arr.count-3).each do |index|
          parent_arr = res_arr[0..index + 1]
          child_arr = res_arr[0..index + 2]
          parent = parent_arr.join("::").classify.constantize.new
          child = child_arr.join("::").classify.constantize.new
          parent.assign_attributes(child_arr.last.underscore.to_sym => child)
          expect(parent.send(child_arr.last.underscore.to_sym)).to be_a(child_arr.join("::").constantize)
        end
      end
    end

#   Reso::DataDictionary.specification.fields_for_class(resource).map{|f| f[:attribute_name]}.each do |attr|
#     it attr do
#     end
#   end
    
  end

end

