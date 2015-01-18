require 'httparty'

response = HTTParty.get("http://localhost:3000/daytrips?place_id=ChIJ6-oK6YWAhYAR6hpLtB5vsv4,ChIJI7NivpmAhYARSuRPlbbn_2w&day=Sunday&start_time=830&end_time=1800")
json_data = response.body
