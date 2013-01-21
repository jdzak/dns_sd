require './dns_sd'

describe DnsSd::LookupResponse, '#parse' do
	let(:r) {DnsSd::LookupResponse.parse('13:07:00.708')}
	
	it "parses time" do
		r.timestamp.should == Date.new(2001,2,3)
	end

	it "parses another time" do
		r.timestamp.should == Date.new(2001,2,3)
	end
end