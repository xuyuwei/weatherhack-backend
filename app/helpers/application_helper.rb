module ApplicationHelper

	def get_businesses_from_location(location)
		response = Yelp.client.search(location, { term: 'attraction' })

		response.businesses.each do |b|
			puts b.name
			puts b.id
			puts "	#{b.location.address}"
			b.categories.each do |c|
				puts "	#{c}"
			end
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
		return result[0].split("\n").first != "no precipitation"
	end

end
