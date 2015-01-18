module ApplicationHelper
	require 'json'
	def update_urls
		(1..16).each do |i|
			place = Place.where({:id => i}).first
			place.icon_url = "https://weatherhack.herokuapp.com/sf/"+(i-1).to_s+".jpg"
			place.save
		end
	end
	
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
		puts "Hello"
	end

	def is_precipitating(location)         

		Wolfram.appid = "KWLWUW-LE66W8A5TK"

		query = "precipitation #{location} next 12 hours"
		result = Wolfram.fetch(query)
		hash = Wolfram::HashPresenter.new(result).to_hash

		pods = hash[:pods]
		result = pods["Result"]
		if (result==nil)
			return false
		end
		if (result[0]==nil)
			return false
		end

		return result[0].split("\n").first != "no precipitation"
	end

	def get_places_from_location(location)
		api_key= "AIzaSyA3x0L_n_C83YIRcCL8irw8-NDFWYQU1Uw"
		base_url="https://maps.googleapis.com/maps/api/place/textsearch/json?"
		city = location.gsub(" ","%20")

		response = HTTParty.get(base_url+"query=attractions+in+"+city+"&key="+api_key)
		json_data = JSON.parse(response.body.to_s)
		results_array = json_data["results"]
		# scraper = Scrapix::GoogleImages.new
		results_array.each do |place|
			puts 'sajajfhfjahashfjafhajasfj'
			address = place["formatted_address"]
			geometry = place["geometry"]
			lat = geometry["location"]["lat"]
			lng = geometry["location"]["lng"]
			icon_url = place["icon"].split("/").last
			name = place["name"]
			place_id = place["place_id"]
			rating = place["rating"]
			types = place["types"]
			flag = false
			tags =""
			city = location
			# scraper.query = name;
			# scraper.total = 1;
			# scraper.options = {safe:true}
			# puts scraper.find

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
				puts place.save

			end
		end
	end

	def get_conditions_from_location(location)
		require "json"
		require 'httparty'

		## I'm gonna assume we were given the location the same way it's handled elsewhere: with spaces between words.
		## Don't want that here, so lets replace spaces with underscores.
		location = location.gsub " ", "_"

		url = "http://api.wunderground.com/api/cad80d94efd1b2f4/hourly/q/CA/#{location}.json"

		response = HTTParty.get(url)
		data = JSON.parse(response.body)

		Condition.where(:city => location).each do |c|
			c.delete
		end

		for i in 0..9
			condition = Condition.new({
				:hour => data["hourly_forecast"][i]["FCTTIME"]["hour"],
				:condition => data["hourly_forecast"][i]["condition"],
				:condition_url => data["hourly_forecast"][i]["icon_url"],
				:city => location.gsub("_", " ")

			})
			condition.save

		end
	end
	
	
end


