class CrewController < ActionController::Base
	respond_to :json

	def index
		@crew = Crew.all
	end

	def show
		@member = Crew.find params[:id]
	end

	def update
		sleep 3
		@member = Crew.find params[:id]
		if @member.update member_params 
			render "crew/show"
		else
			# respond with model, that by default will respond with validation
			# errors in form of the JSON
			respond_with @member
		end	
	end

	def create
		@member = Crew.new new_member_params
		if @member.save
			render crew_index_path
		else 
			respond_with @member
		end
	end

	private

		def new_member_params
			params.permit(:name)
		end

		def member_params
			params.require(:crew).permit(:age, :name, :avatar, :title, :species, :origin, :quote)
		end
end