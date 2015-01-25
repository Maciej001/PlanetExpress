do (Backbone) ->

	# this functions extends Marionette Application, as they don't need to know
	# about Application specific instances. 
	# _.extend adds them to Marionette.Application prototype

	_.extend Backbone.Marionette.Application::, 

		navigate: (route, options = {}) ->
			# route = "#" + route if route.charAt(0) is "/"
			Backbone.history.navigate route, options

		getCurrentRoute: ->
			frag = Backbone.history.fragment
			if _.isEmpty(frag) then null else frag

		startHistory: ->
			if Backbone.history
				Backbone.history.start()

		register: (instance, id) ->
			@_registry ?= {}
			@_registry[id] = instance

		unregister: (instance, id) ->
			delete @_registry[id]
