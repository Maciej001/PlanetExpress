class CrewController < ActionController::Base
	respond_to :json

	def index
		@crew = Crew.all
	end

	def show
		@member = Crew.find params[:id]
	end
end