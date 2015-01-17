require 'httparty'
require 'certified'
require 'json'



def getSchedules(all_schedules, place_ids, addresses,place_tags, been_to, sofar, precip, startTime, endTime)
	(0..place_ids-1).each do |i|
		if (been_to[i]==false)
			time_spent = getTime(place_tags[i].split("|"))
			operating_times = getOperatingTimes(place_ids[i])
			newBeenTo = Array.new(all_schedules.length)

		end
	end
	all_schedules.append(sofar)
end

def getTime(tags)
	tags.each do |t|
		if (t=="aquarium")
			return 430
		elsif(t=="museum")
			return 330
		elsif (t=="art_gallery")
			return 230
		elsif (t=="shopping_mall")
			return 300
		elsif (t=="movie_theater")
			return 200
		elsif (t=="church")
			return 100
		elsif (t=="establishment")
			return 100
		else
			return 150
		end
	end
end

def getOperatingTimes(place_id,dayNum)
	api_key = "AIzaSyC2HDpSzn-JhnA6cgIzBcaCDSPKV2HJ_wY"
	base_url = "https://maps.googleapis.com/maps/api/place/details/json?"
	response = HTTParty.get(base_url+"placeid="+place_id+"&key="+api_key)
	json_data = JSON.parse(response.body.to_s)
	periods = json_data["result"]["opening_hours"]
end

getOperatingTimes("ChIJg2Kun5KAhYARg0g3AF1jbQQ")