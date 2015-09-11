require 'open-uri'
require 'json'

class RecycleBin

	def data
		url = "http://data.cityofnewyork.us/resource/sxx4-xhzg.json"
		response = open(url).read
		data = JSON.parse(response)
	end

	def puts_each_address
		data.each do |bin_hash|
			puts bin_hash["address"]
		end
	end

	def find_by_borough(borough)
		data.select {|bin_hash| bin_hash["borough"] == borough}
	end

end