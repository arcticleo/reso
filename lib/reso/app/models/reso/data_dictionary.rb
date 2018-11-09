class Reso::DataDictionary

  @@instance = Reso::DataDictionary.new

  def self.specification
    return @@instance
  end

  private_class_method :new

end
