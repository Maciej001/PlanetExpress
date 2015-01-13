@PlanetExpress.module "Views", (Views, App, Backbone, Marionette, $, _) ->

	_remove = Marionette.View::remove

	_.extend Marionette.View::,

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