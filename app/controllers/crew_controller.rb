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
			render "crew/show"
		else
			# respond with model, that by default will respond with validation
			# errors in form of the JSON
			respond_with @member
		end	
	end

	private

		def member_params
			params.require(:crew).permit(:age, :name, :avatar, :title, :species, :origin, :quote)
		end
end