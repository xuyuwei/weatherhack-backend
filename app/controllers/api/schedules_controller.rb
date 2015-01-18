module Api
  class SchedulesController < Api::BaseController
  	include ScheduleHelper
  	include ApplicationHelper
  	include CreatorHelper
  	def initialize
  		@all_schedules=[]
  	end
  	def create
		set_resource(resource_class.new(resource_params))

		  if get_resource.save
		    render :show, status: :created
		  else
		    render json: get_resource.errors, status: :unprocessable_entity
		  end
		end

		# DELETE /api/{plural_resource_name}/1
		def destroy
		  get_resource.destroy
		  head :no_content
		end

		# GET /api/{plural_resource_name}
		def index
		  
		  places= query_params[:place_id].split(",")
		  
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
		  # puts addressArray.inspect
		  # puts idArray.inspect
		  # puts latArray.inspect
		  # puts lngArray.inspect
		  # puts nameArray.inspect
		  # puts tagArray.inspect
		  precip = 0.4
		  date = query_params[:day]
		  dayNum = getDayNumber(date)
		  puts dayNum.inspect
		  startTime = query_params[:start_time]
		  endTime = query_params[:end_time]
		  puts date
		  puts startTime
		  puts endTime	
		  been_to = Array.new(nameArray.length,false)
		  getAllDistances(addressArray)

		  schedules = get(-1,nameArray,idArray,tagArray,been_to,[],precip,
		  	startTime.to_i,endTime.to_i,dayNum)

		  puts schedules		  #storeSchedule(query_params[:place_id],dayNum,startTime,endTime,schedules)
		  

		  plural_resource_name = "@#{resource_name.pluralize}"
		  resources = resource_class.where(query_params)
		                            .page(page_params[:page])
		                            .per(page_params[:page_size])

		  instance_variable_set(plural_resource_name, resources)
		  respond_with instance_variable_get(plural_resource_name)
		  
		end

		# GET /api/{plural_resource_name}/1
		def show
		  respond_with get_resource
		end

		# PATCH/PUT /api/{plural_resource_name}/1
		def update
		  if get_resource.update(resource_params)
		    render :show
		  else
		    render json: get_resource.errors, status: :unprocessable_entity
		  end
		end


      def schedule_params
      	#todo
        params.require(:schedule).permit(:place_id,:day,:start_time,:end_time)
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        #todo
        params.permit(:place_id,:day,:start_time,:end_time)
      end
	end
end