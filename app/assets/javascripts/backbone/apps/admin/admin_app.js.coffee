@PlanetExpress.module "AdminApp", (AdminApp, App, Backbone, Marionette, $, _) ->

	class AdminApp.Router extends Marionette.AppRouter
		appRoutes:
			"admin": "list"

	API =
		list: ->
			# after routing to list, we will trigger app event nav:choose
			# vent/commands handler should never be put in controllers or views
			App.vent.trigger "nav:choose", "Admin"
			new AdminApp.List.Controller

	App.addInitializer -> 
		new AdminApp.Router
			controller: API 

