module DnsSd
	class LookupRequest < Struct.new(:host, :service)
		def send
			return unless block_given?
			IO.popen("dns-sd -L #{host} #{service}") do |f|
				while (a = f.gets)
					resp =  LookupResponse.parse(a)
					if resp
						yield LookupResponse.parse(a)
					end
				end
			end
		end
	end

	class LookupResponse < Struct.new(:host, :service, :timestamp)
		# Parses the lookup response from running `dns-sd -L`.
		#
		# An example of the response string is..
		# 13:07:00.708  mini._plexmediasvr._tcp.local. can be reached at mini.local.:32400 (interface 10)
		#   playersModified=1358743734 version=0.9.3.4-397e914 machineIdentifier=3fdaedc07f3506d9f68c58a2f3e323a2ace298ec
		#
	  # @param [String] the response of a dns-sd lookup request
	  # @return [LookupResponse] the object parsed from a string
		def self.parse(raw)
			match = raw.scan(/^(\d{2}:\d{2}:\d{2}.\d{3})(\s+)(\w+\.\w+\.\w+\.\w+\.)( can be reached at )(\w+\.\w+\.:\d+)/)[0]
			if match && match.count > 0
				timestamp = match[0]
				service = match[2]
				host = match[4]
				if timestamp && service && host
					new(host, service, timestamp)
				else
					nil
				end
			end
		end
	end
end
