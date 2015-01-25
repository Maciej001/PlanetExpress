@PlanetExpress.module "CrewApp", (CrewApp, App, Backbone, Marionette, $, _) ->

	class CrewApp.Router extends Marionette.AppRouter
		appRoutes:
			"crew/:id/edit" :	"edit"
			"crew"					: "list"

	API = 
		list: ->
			# before, we were using just a .list() function on the controller
			# but now it's been changed to instantiate new controller that 
			# will be send to garbage once we close the view. It will also 
			# unbind all event listeners and prevent memory leaks
			# CrewApp.List.Controller.list()

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