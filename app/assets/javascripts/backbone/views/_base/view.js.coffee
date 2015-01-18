@PlanetExpress.module "Views", (Views, App, Backbone, Marionette, $, _) ->

	_remove = Marionette.View::remove

	_.extend Marionette.View::,

		setInstancePropertiesFor: (args...) ->
			# _.pick returns a copy of the object filtered to only have
			# values for the whitelisted args...
			# _.pick({name: 'moe', age: 50, userid: 'moe1'}, 'name', 'age')
			# => {name: 'moe', age: 50
			# @options is available within view as it is and object passed
			# when initializing view
			# if you pass arguments: "config", "buttons" then
			# @config and @buttons will be available in the View
			for key, val of _.pick(@options, args...)
				@[key] = val

		remove: (args...) ->
			console.log "removing ", @
			_remove.apply @, args

		templateHelpers: ->

			linkTo: (name, url, options = {}) ->
				# _.defaults - fills in 'external' option if is not defined with the value of 'false'
				_.defaults options,
					external: false

				url = "#" + url unless options.external 

				"<a href='#{url}>#{@escape(name)}</a>"