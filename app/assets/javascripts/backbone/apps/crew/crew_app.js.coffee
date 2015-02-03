@PlanetExpress.module "CrewApp", (CrewApp, App, Backbone, Marionette, $, _) ->

	class CrewApp.Router extends Marionette.AppRouter
		appRoutes:
			"crew/:id/edit" :	"edit"
			"crew"					: "list"

		# before and after are the router callback functions added by 
		# vendor/assets/javascript/backbone-routefilter.js
		before: ->
			App.vent.trigger "nav:choose", "Crew"

	API = 
		list: ->
			new CrewApp.List.Controller

		newCrew: (region) ->
			# we need to return not controller but view
			# controller initializer doesn't return anything so in 
			# New.Controller we had to create @formView which can be used here
			# Marionette controllers accept only one argument
			new CrewApp.New.Controller
				region: region

		edit: (id, member) ->
			# passing an object containing to values, as controllers accept
			# only one argument
			new CrewApp.Edit.Controller
				id: id
				crew: member

	App.commands.setHandler "new:crew:member", (region) ->
		API.newCrew region

	App.vent.on "crew:member:clicked crew:created", (member) ->
		App.navigate Routes.edit_crew_path(member.id)
		API.edit member.id, member  

	App.vent.on "crew:cancelled crew:updated", (crew) ->
		App.navigate Routes.crew_index_path()
		API.list()

	App.addInitializer ->
		new CrewApp.Router 
			controller: API 