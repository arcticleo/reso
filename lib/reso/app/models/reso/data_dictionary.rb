class Reso::DataDictionary

  @@instance = Reso::DataDictionary.new

  def self.specification
    return @@instance
  end

  private_class_method :new

  def xml_doc
    return @doc ||= Nokogiri::XML(open(self.xml_path))
  end

  def xml_path
    "reso-1.7.xml"
  end

  def resources
    resources = []
    self.xml_doc.xpath('//Resource').map do |resource|
      resources << resource["WikiPageTitle"].to_s.split(" ").first.classify
      resources << self.groups_for_resource(resources.last)
    end
    return resources.flatten.presence.compact.map{|res| "Reso::#{res}" }
  end

  def fields_for_resource res
    fields = []
    self.xml_doc.css("Resource").each do |resource|
      if resource["WikiPageTitle"].to_s.split(" ").first.eql?(res)
        resource.css("Field").each do |field|
          if field.at_css('ElementStatus').content.to_s.eql?("Active")
            fields << {
              "standard_name": field.at_css("StandardName").content,
              "attribute_name": field.at_css("StandardName").content.underscore,
              "definition": field.at_css("Definition").content,
              "groups": field.css("Group").map{|group| group.content.split(" ").first},
              "lookup_status": (v = field.at_css("LookupStatus").content).include?("n/a") ? nil : v.blank? ? nil : v,
              "lookup": (v = field.at_css("Lookup").content).include?("n/a") ? nil : v.blank? ? nil : v,
              "collection": (v = field.at_css("Collection").try(:content)).to_s.include?("n/a") ? nil : v.blank? ? nil : v,
              "simple_data_type": field.at_css("SimpleDataType").content,
              "sug_max_length": field.at_css("SugMaxLength").content,
              "certification_level": field.at_css("CertificationLevel").content,
              "payloads": field.at_css("Payloads").content,
              "property_types": field.css("PropertyTypes Class").map{|pt| pt.content},
              "record_id": field.at_css("RecordID").content,
              "added_in_version": (v = field.at_css("AddedInVersion").content).include?("n/a") ? nil : v.blank? ? nil : v,
              "sug_max_precision": (v = field.at_css("SugMaxPrecision").content).include?("n/a") ? nil : v.blank? ? nil : v,
              "repeating_element": field.at_css("RepeatingElement").content,
              "status_change_date": field.at_css("StatusChangeDate").content,
              "revised_date": field.at_css("RevisedDate").content,
              "modification_timestamp": field.at_css("ModificationTimestamp").content
            }
          end
        end
      end
    end
    return fields
  end

  def groups_for_resource res
    fields = self.fields_for_resource res
    groups = fields.map{|f| f[:groups]}.flatten.uniq.map{|f| f.classify}
    base_resource, sub_resources = groups.first, groups - [groups.first]
    return [] if sub_resources.blank?
    return sub_resources.map{|resource| [base_resource, resource].join()}
  end

end

