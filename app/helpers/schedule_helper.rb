module ScheduleHelper

	def getDayNumber(day)
		hash = {"Sunday" => 0,
			"Monday" => 1,
			"Tuesday" => 2,
			"Wednesday" => 3,
			"Thursday" => 4,
			"Friday" => 5,
			"Saturday" => 6
		}
		return hash[day]
	end

	def storeSchedule(place_id,day,start_time,end_time,body)
		schedule = Schedule.new
		schedule.place_id = place_id
		 schedule.day = day
		  schedule.start_time = start_time
		  schedule.end_time = end_time
		  schedule.body = body
		  schedule.save
	end
end