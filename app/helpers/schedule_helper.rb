module ScheduleHelper
	def getAllDistances(addresses)
		num = addresses.length
		dists = Array.new(num)
		api_key = "AIzaSyC2HDpSzn-JhnA6cgIzBcaCDSPKV2HJ_wY"
		base_url = "https://maps.googleapis.com/maps/api/directions/json?"	
		(0..num-1).each do |i|
			(i..num-1).each do |j|
				if (i!=j)
					if (dists[i]==nil)
						dists[i] = Array.new(num)
					end
					if (dists[j]==nil)
						dists[j]=Array.new(num)
					end
					response = HTTParty.get(base_url+"origin="+ addresses[i].gsub(" ","%20") + "&destination=" + addresses[j].gsub(" ","%20") + "&key="+api_key)
					json_data = JSON.parse(response.body.to_s)
					
					time = json_data["routes"][0]["legs"][0]["duration"]["text"]
					time = parseTime(time)
					dists[i][j]=time
					dists[j][i]=time
				end
			end
		end
		return dists
	end

	def parseTime(time)
		array = time.split(" ")
		if (array.length==2)
			array[0].to_i
		elsif (array.length==4)
			array[0].to_i*60+array[2].to_i
		end
	end

	def getDayNumber(day)
		hash = {"Sunday" => 0,
			"Monday" => 1,
			"Tuesday" => 2,
			"Wednesday" => 3,
			"Thursday" => 4,
			"Friday" => 5,
			"Saturday" => 6
		}
	end
end