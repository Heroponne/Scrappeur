require_relative '../lib/townhall.rb'

describe "the get_townhall_urls method" do
  it "should not be nil" do
    expect(get_townhall_urls('https://www.annuaire-des-mairies.com/val-d-oise.html')).not_to be_nil 
  end
  it "should return an Array" do
    expect(get_townhall_urls('https://www.annuaire-des-mairies.com/val-d-oise.html')).to be_instance_of Array 
  end
end

describe "the perform method" do
  it "should not be nil" do
    expect(perform).not_to be_nil 
  end
  it "should return an Array" do
    expect(perform).to be_instance_of Array 
  end
end