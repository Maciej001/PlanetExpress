@PlanetExpress.module "Controllers", (Controllers, App, Backbone, Marionette, $, _) ->

	class Controllers.Application extends Marionette.Controller

		# constructor is called even before initialize method
		constructor: (options = {}) ->
			# request handled in app.js.coffee. Returns mainRegion
			# we need it to extend show method below.
			# Region is extracted form options if it was passed when
			# controller was constructed. Otherwise it uses defaul region

			@region = options.region or App.request "default:region"
			super options

			# create unique id for each controller
			@_instance_id = _.uniqueId("controller_")
			App.execute "register:instance", @, @_instance_id

		# arguments passed to destroy will be automatically passed 
		# to super so we don't need to explicitly pass them
		destroy: ->
			super
			App.execute "unregister:instance", @, @_instance_id

		show: (view, options = {}) ->
			_.defaults options,
				loading: 	false
				region:		@region


			# automatically destroy controller when view is 'destroyed'
			@listenTo view, "destroy", @destroy 

			@_manageView view, options

		_manageView: (view, options) ->
			if options.loading
				App.execute "show:loading", view, options 
			else
				# we could use @region.show view instead
				options.region.show view
			
