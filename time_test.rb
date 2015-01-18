def adjustTime(time)
		
		if (time>=1200)
			new_time = time.to_s
			time = time/100-12
			new_time = time.to_s + ":" + new_time[2..3]+" pm"
			return new_time
		else
			new_time = time%100
			time = time/100
			
			if (new_time<10)
				new_time = "0"+new_time.to_s
			end
			new_time = time.to_s+ ":" + new_time.to_s + " am"
			return new_time
		end
	end
puts adjustTime(359)
puts adjustTime(1000)
puts adjustTime(1111)
puts adjustTime(1456)
puts adjustTime(2359)