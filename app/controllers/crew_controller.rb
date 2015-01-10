class CrewController < ActionController::Base
	respond_to :json

	def index
		@crew = Crew.all
	end
end