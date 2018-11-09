RSpec.describe Reso::DataDictionary do
  it "can be accessed through singleton" do
    expect(Reso::DataDictionary.specification).to be_a(Reso::DataDictionary)
  end

  it "cannot initialize instance" do
#    expect(Reso::DataDictionary.new).to be_a(Reso::DataDictionary)
    expect{Reso::DataDictionary.new}.to raise_error(NoMethodError)
  end

end
