@PlanetExpress.module "Controllers", (Controllers, App, Backbone, Marionette, $, _) ->

	class Controllers.Base extends Marionette.Controller

		# constructor is called even before initialize method
		constructor: (options = {}) ->
			# request handled in app.js.coffee. Returns mainRegion
			# we need it to extend show method below
			@region = options.region or App.request "default:region"
			super options

		show: (view) ->
			# automatically destroy controller when view is 'destroyed'
			@listenTo view, "destroy", @destroy
			@region.show view

