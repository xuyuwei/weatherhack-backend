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
	end

end
