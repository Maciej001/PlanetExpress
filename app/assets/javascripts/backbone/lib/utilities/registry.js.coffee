@PlanetExpress.module "Utilities", (Utilities, App, Backbone, Marionette, $, _) ->

	API = 
		register: (instance, id) ->
			@_registry ?= {}
			@_registry[id] = instance

			Window.r = @_registry

		unregister: (instance, id) ->
			delete @_registry[id]

		resetRegistry: ->
			oldCount = @getRegistrySize()
			for key, controller of @_registry
				controller.region.reset()

			msg = "There were #{oldCount} controllers in the registry, there are now #{@getRegistrySize()}"
			if @getRegistrySize() > 0 then console.log(msg, @_registry) else console.log msg		

		getRegistrySize: ->
			_.size @_registry	

	App.commands.setHandler "register:instance", (instance, id) =>
		API.register instance, id if App.environment is "development" 

	App.commands.setHandler "unregister:instance", (instance, id) ->
		API.unregister instance, id if App.environment is "development"

	App.reqres.setHandler "reset:registry", ->
		API.resetRegistry()
