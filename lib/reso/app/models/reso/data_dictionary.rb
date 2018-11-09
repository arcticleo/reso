class Reso::DataDictionary

  @@instance = Reso::DataDictionary.new

  def self.specification
    return @@instance
  end

  private_class_method :new

  def xml_path
    "reso-1.7.xml"
  end

  def models
    return []
  end

end
