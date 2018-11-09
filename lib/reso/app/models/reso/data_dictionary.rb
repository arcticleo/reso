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
    return self.xml_doc.xpath('//Resource').map do |resource|
      "Reso::DataDictionary::#{resource["WikiPageTitle"].to_s.split(" ").first}".classify
    end
  end

end
