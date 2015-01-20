@PlanetExpress.module "CrewApp.New", (New, App, Backbone, Marionette, $, _) ->

	New.Controller = 

		newCrew: ->
			crew = App.request "new:crew:entity"
			newView = @getNewView()
			newView

		getNewView: ->
			new New.Crew