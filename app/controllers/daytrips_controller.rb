
  class DaytripsController < ApplicationController
  	include CreatorHelper
  	include ScheduleHelper
  	include ApplicationHelper
  	def initialize
  		@all_schedules = []
  	end
  	def index
  		puts params
  		places= params[:place_id].split(",")
		  
		  addressArray = []
		  idArray = []
		  latArray = []
		  lngArray = []
		  nameArray =[]
		  tagArray=[]
		  city=""
		  places.each do |p|
		  	place = Place.where({:place_id => p}).first
		  	if (place!=nil)
		  		address=place.address
		  		addressArray.push(address)
		  		idArray.push(place.place_id)
		  		latArray.push(place.lat)
		  		lngArray.push(place.lng)
		  		nameArray.push(place.name)
		  		tagArray.push(place.tags)
		  		city = place.city
		  	end
		  end
		  precip = is_precipitating(city);  
		  date = params[:day]
		  dayNum = getDayNumber(date)
		  startTime = params[:start_time]
		  endTime = params[:end_time]

		  been_to = Array.new(nameArray.length,false)
		  puts addressArray
		  distances = getAllDistances(addressArray)
		  puts distances
		  getSchedules(@all_schedules,distances,latArray, lngArray,-1,nameArray,idArray,tagArray,been_to,[],precip,
		  	startTime.to_i,endTime.to_i,dayNum)

		  
		 
		  @all_schedules = @all_schedules.to_json
  	end

  end
