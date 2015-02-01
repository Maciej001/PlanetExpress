@PlanetExpress.module "Deliveries", (Deliveries, App, Backbone, Marionette, $, _) ->

	class Deliveries.Router extends Marionette.AppRouter
		appRoutes:
			"deliveries": "list"

	API = 

		list: ->
			new Deliveries.List.Controller

	App.addInitializer ->
		new Deliveries.Router
			controller: API 

