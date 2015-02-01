@PlanetExpress.module "AdminApp", (AdminApp, App, Backbone, Marionette, $, _) ->

	class AdminApp.Router extends Marionette.AppRouter
		appRoutes:
			"admin": "list"

	API = 

		list: ->
			new AdminApp.List.Controller

	App.addInitializer ->
		new AdminApp.Router
			controller: API 

