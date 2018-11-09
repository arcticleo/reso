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

  it "includes method :models" do
    expect(Reso::DataDictionary.specification.methods.include? :models).to be_truthy
  end

  it ":models returns array" do
    expect(Reso::DataDictionary.specification.models).to be_a(Array)
  end

end
