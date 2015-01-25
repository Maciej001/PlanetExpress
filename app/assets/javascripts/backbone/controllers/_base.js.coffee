@PlanetExpress.module "Controllers", (Controllers, App, Backbone, Marionette, $, _) ->

	class Controllers.Base extends Marionette.Controller

		# constructor is called even before initialize method
		constructor: (options = {}) ->
			# request handled in app.js.coffee. Returns mainRegion
			# we need it to extend show method below
			@region = options.region or App.request "default:region"
			super options

			# create unique id for each controller
			@_instance_id = _.uniqueId("controller_")
			App.execute "register:instance", @, @_instance_id


		show: (view) ->
			# automatically destroy controller when view is 'destroyed'
			@listenTo view, "destroy", @destroy 
			@region.show view

		destroy: (args...) ->
			super args
			App.execute "unregister:instance", @, @_instance_id
			
