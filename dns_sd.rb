module DnsSd
	class LookupResponse < Struct.new(:timestamp)
		# Parses the lookup response from running `dns-sd -L`.
		#
		# The string should follow the format:
		# 13:07:00.708  mini._plexmediasvr._tcp.local. can be reached at mini.local.:32400 (interface 10)
		#   playersModified=1358743734 version=0.9.3.4-397e914 machineIdentifier=3fdaedc07f3506d9f68c58a2f3e323a2ace298ec
		#
	  # @param [String] the response of a dns-sd lookup request
	  # @return [LookupResponse] the object parsed from a string
		def self.parse(raw)
			match = /^\d{2}:\d{2}:\d{2}.\d{3}/.match(raw)
			timestamp = match[0]
			new(timestamp)
		end
		# IO.popen('dns-sd -L mini _plexmediasvr') do |f|
	# while (a = f.gets) do
		# puts a
	end
end


# require 'open3'

# Open3.popen3('ruby stdout_test.rb') {|stdin, stdout, stderr, wait_thr|
# 	while (a = stdout.gets) do
# 		puts a
# 	end
# }

# stdin, stdout, stderr, wait_thr = Open3.popen3('ruby stdout_test.rb')
# while (a = stdout.gets)
# 	puts a	
# end