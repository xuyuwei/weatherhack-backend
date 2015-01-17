module Api
  class ScheduleController < Api::BaseController
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
		 private

      def schedule_params
      	#todo
        params.require(:schedule).permit()
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        #todo
        params.permit()
      end
	end
end