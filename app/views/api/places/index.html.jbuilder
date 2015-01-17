json.places @places do |place|
   json.name place.name
   json.place_id place.place_id
   json.city place.city
   json.tags place.tags
   json.icon_url place.icon_url
   json.address place.address
   json.rating place.rating
   json.lat place.lat
   json.lng place.lng

end