require File.dirname(__FILE__) + '/dns_sd'

req = DnsSd::LookupRequest.new('mini', '_plexmediasvr')
req.send do |response|
	puts "mini is active!!"
	puts response.inspect
end


# require 'open3'
# Open3.popen3('dns-sd -L mini _plexmediasvr') {|stdin, stdout, stderr, wait_thr|
# puts stdin
# while(a = stdout.gets)
# 	puts a
# end
# puts stderr
# 	}