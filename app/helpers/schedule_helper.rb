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
end