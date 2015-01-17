json.conditions @conditions do |c|
   json.hour c.hour
   json.condition c.condition
   json.condition_url c.condition_url
   json.location c.location
end