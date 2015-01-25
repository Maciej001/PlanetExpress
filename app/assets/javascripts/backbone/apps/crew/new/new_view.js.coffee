@PlanetExpress.module "CrewApp.New", (New, App, Backbone, Marionette, $, _) ->

	class New.Crew extends App.Views.ItemView
		template: "crew/new/new_crew"

		# add config for your form wrapper
		form: 
			buttons: 
				placement: 	"left"
				primary: 		"Create"
				
 