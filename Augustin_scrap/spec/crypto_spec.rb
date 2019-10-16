require_relative '../lib/crypto.rb'

describe "the get_cryto method" do
  it "should not be nil" do
    expect(get_cryto("https://coinmarketcap.com/all/views/all/")).not_to be_nil 
  end
  it "should return an Array" do
    expect(get_cryto("https://coinmarketcap.com/all/views/all/")).to be_instance_of Array 
  end
end
