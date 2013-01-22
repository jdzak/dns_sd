require File.dirname(__FILE__) + '/dns_sd'

req = DnsSd::LookupRequest.new('mini', '_plexmediasvr')
req.send do |response|
  puts "mini is active!!"
  puts response.inspect
end