@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->
	
	class Edit.LayoutView extends App.Views.LayoutView
		template: "crew/edit/edit_layout"

		regions: 
			formRegion: "#form-region"

		# We don't need below code anymore, because we implemented
		# 'when:fetched' method

		# # When we are rendering the edit form, we still did not fetch all 
		# # crew member data. 'sync' is the last event that fires after 
		# # fetching modelEvents: 
		# #	"sync": "render" 

	class Edit.Crew extends App.Views.ItemView
		template: "crew/edit/edit_crew"

