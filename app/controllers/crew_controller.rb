class CrewController < ActionController::Base
	respond_to :json

	def index
		@crew = Crew.all
	end

	def show
		@member = Crew.find params[:id]
	end

	def update 
		@member = Crew.find params[:id]
		if @member.update member_params 
			# model in rabl is returned and crew_app.js.coffee redirects to 
			# next form
			render "crew/show"
		else
			# respond with model, that by default will respond with validation
			# errors in form of the JSON
			respond_with @member
		end	
	end

	def create
		@member = Crew.new new_member_params

		logger.info "Logger sie klania niziutko"

		if @member.save
			render 'crew/show'
			logger.info "crew/show rendering..."
		else 
			respond_with @member
			logger.info "responding with @member"
		end
	end

	def destroy
		member = Crew.find params[:id]
		member.destroy()
		render json: {}  # backbone expects valid JSON response
	end

	private

		def new_member_params
			params.permit(:name)
		end

		def member_params
			params.require(:crew).permit(:age, :name, :avatar, :title, :species, :origin, :quote)
		end
end