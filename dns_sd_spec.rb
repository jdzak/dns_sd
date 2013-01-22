require './dns_sd'

describe DnsSd::LookupResponse, '#parse' do
  let(:raw) do
%Q(13:07:00.708  mini._plexmediasvr._tcp.local. can be reached at mini.local.:32400 (interface 10)
 playersModified=1358743734 version=0.9.3.4-397e914 machineIdentifier=3fdaedc07f3506d9f68c58a2f3e323a2ace298ec)
  end

  let(:r) {DnsSd::LookupResponse.parse(raw)}
  
  it "parses time" do
    r.timestamp.should == '13:07:00.708'
  end

  it "parses time" do
    r.service.should == 'mini._plexmediasvr._tcp.local.'
  end

  it "parses time" do
    r.host.should == 'mini.local.:32400'
  end
end