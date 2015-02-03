@PlanetExpress.module "DeliveriesApp", (DeliveriesApp, App, Backbone, Marionette, $, _) ->

	class DeliveriesApp.Router extends Marionette.AppRouter
		appRoutes:
			"deliveries": "list"

	API = 
		list: ->
			App.vent.trigger "nav:choose", "Deliveries"
			new DeliveriesApp.List.Controller

	App.addInitializer ->
		new DeliveriesApp.Router
			controller: API 

