
  class DaytripsController < ApplicationController
  	include CreatorHelper
  	include ScheduleHelper
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
		  	end
		  end
		  precip = 0.4
		  date = params[:day]
		  dayNum = getDayNumber(date)
		  startTime = params[:start_time]
		  endTime = params[:end_time]

		  been_to = Array.new(nameArray.length,false)
		  distances = getAllDistances(addressArray)

		  getSchedules(@all_schedules,distances,latArray, lngArray,-1,nameArray,idArray,tagArray,been_to,[],precip,
		  	startTime.to_i,endTime.to_i,dayNum)

		  
		 
		  @all_schedules = @all_schedules.to_json
  	end

  end
