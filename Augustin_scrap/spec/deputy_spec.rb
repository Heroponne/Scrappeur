require_relative '../lib/deputy.rb'

describe "the get_cryto method" do
  url = 'https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=580'
  it "should not be nil" do
    expect(get_deputy_emails(url)).not_to be_nil 
  end
  it "should return an Array" do
    expect(get_deputy_emails(url)).to be_instance_of Array 
  end
end
