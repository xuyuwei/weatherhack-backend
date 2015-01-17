module ApplicationHelper
	require 'json'
	
	def get_businesses_from_location(location)
		response = Yelp.client.search(location, { term: 'attraction' })

		response.businesses.each do |b|

			name = b.name
			place_id = b.id
			address = ""
			b.location.address.each do |a|
				address+=a+" "
			end
			address = address[0..address.length-2]
			tag = ""
			b.categories.each do |c|
				tag +=c[1]+"|"
			end
			tag = tag[0..tag.length-2]

			puts name
			puts place_id
			puts address
			puts tag

		end
	end

	def get_places_from_location(location)
		api_key= "AIzaSyC2HDpSzn-JhnA6cgIzBcaCDSPKV2HJ_wY"
		base_url="https://maps.googleapis.com/maps/api/place/textsearch/json?"
		city = location.gsub(" ","%20")

		response = HTTParty.get(base_url+"query=points+of+interest+in+"+city+"&key="+api_key)
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
			flag = false
			tags =""
			city = location
			types.each do |t|
				if (t!=nil)
					tags+=t+"|"
				end
				if (t=="restaurant" || t=="lodging")
					flag = true
				end
			end
			tags=tags[0..tags.length-2]
			if (!flag)
				place = Place.new({
					:address => address,
					:lat => lat,
					:lng => lng,
					:icon_url => icon_url,
					:name => name,
					:place_id => place_id,
					:rating => rating,
					:city => location,
					:tags => tags
					})
				place.save
			end
		end
	end
	
	
end


