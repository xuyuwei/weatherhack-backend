require 'httparty'
require 'certified'
require 'json'
API_KEY = "AIzaSyC2HDpSzn-JhnA6cgIzBcaCDSPKV2HJ_wY"
base_url="https://maps.googleapis.com/maps/api/place/textsearch/json?"
city = "San%20Francisco"
response = HTTParty.get(base_url+"query=points+of+interest+in+"+city+"&key="+API_KEY)
json_data = JSON.parse(response.body.to_s)
results_array = json_data["results"]

results_array.each do |place|
	address = place["formatted_address"]
	geometry = place["geometry"]
	lat = geometry["location"]["lat"]
	lng = geometry["location"]["lng"]
	icon_url = place["icon"]
	name = place["name"]
	place_id = place["place_id"]
	rating = place["rating"]
	types = place["types"]
	
	
end



puts json_data