class RESO::DataDictionary

  @@instance = RESO::DataDictionary.new

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
    return resources.flatten.presence.compact.map{|res| "RESO::#{res}" }
  end

  def lookup_fields
    self.xml_doc.css("LookupValue LookupField").map do |item|
      "RESO::Lookup::#{item.content.classify}"
    end.uniq.sort.delete_if{|item| item.include?("[")}
  end

  def fields_for_resource res
    fields = []
    self.xml_doc.css("Resource").each do |resource|
      if resource["WikiPageTitle"].to_s.split(" ").first.classify.eql?(res)
        resource.css("Field").each do |field|
#          if field.at_css('ElementStatus').content.to_s.eql?("Active")
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
              "modification_timestamp": field.at_css("ModificationTimestamp").content,
              "migration_column": migration_column_for_field(field)
            }
          end
#        end
      end
    end
    return fields
  end

  def migration_column_for_field field
    streng = ""
    case field.at_css("SimpleDataType").content
    when "String"
      if field.at_css("SugMaxLength").content.to_i > 255
        streng = "t.text :#{field.at_css("StandardName").content.underscore}"
      else
        streng = "t.string :#{field.at_css("StandardName").content.underscore}, limit: #{field.at_css("SugMaxLength").content.to_i}"
      end
    when "Number"
      if field.at_css("SugMaxPrecision").content.to_i.zero?
        case field.at_css("SugMaxLength").content.to_i
        when (9..255)
          streng = "t.string :#{field.at_css("StandardName").content.underscore}, limit: #{field.at_css("SugMaxLength").content.to_i} # TODO: validates :#{field.at_css("StandardName").content.underscore}, format: { with: /\A[0-9]+\z/ }"
        when (2..8)
          streng = "t.integer :#{field.at_css("StandardName").content.underscore} # TODO: verify length of .to_s to max #{field.at_css("SugMaxLength").content.to_i}"
        else
          streng = "//TODO - #{field.at_css("StandardName").content.underscore} - #{field.at_css("SimpleDataType").content} - #{field.at_css("SugMaxLength").content.to_i} - #{field.at_css("SugMaxPrecision").content.to_i}"
        end
      else
        streng = "t.decimal :#{field.at_css("StandardName").content.underscore}, limit: #{field.at_css("SugMaxLength").content.to_i}, precision: #{field.at_css("SugMaxPrecision").content.to_i}"
      end
    when "Timestamp"
      streng = "t.datetime :#{field.at_css("StandardName").content.underscore}"
    when "Boolean"
      streng = "t.boolean :#{field.at_css("StandardName").content.underscore}"
    when "Date"
      streng = "t.date :#{field.at_css("StandardName").content.underscore}"
    when "Collection"
      streng = "t.string :#{field.at_css("StandardName").content.underscore} # TODO: DELETE - Collection - has_many :through"
    when "String List, Single"
      streng = "t.text :#{field.at_css("StandardName").content.underscore}, limit: #{field.at_css("SugMaxLength").content.to_i} # TODO: DELETE - String List, Single - has_one :through"
    when "String List, Multi"
      streng = "t.text :#{field.at_css("StandardName").content.underscore}, limit: #{field.at_css("SugMaxLength").content.to_i} # TODO: DELETE - String List, Multi - has_many :through"
    else
      streng = "//TODO - #{field.at_css("StandardName").content.underscore} - #{field.at_css("SimpleDataType").content} - #{field.at_css("SugMaxLength").content.to_i} - #{field.at_css("SugMaxPrecision").content.to_i}"
    end
    streng = "# TODO: Handle dynamic fields - #{streng}" if streng.include?("[")
    return streng
  end

  def fields_for_class klass
    klass_parts = klass.split("::")
    return [] unless klass_parts.first.eql?("RESO") && klass_parts.count > 1
    fields = self.fields_for_resource klass_parts.second
    return fields.delete_if{|f| f[:groups].map(&:classify) != klass_parts.drop(1)}
  end

  def groups_for_resource res
    fields = self.fields_for_resource res
    return fields.map{|f| f[:groups].join("::").classify}.flatten.uniq.sort.delete_if{|f| !f.include?("::")}
  end


end

