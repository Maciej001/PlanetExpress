@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Model extends Backbone.Model

		# override default Backbone save method, setting wait: true
		# we will wait for server before setting the new attributes
		# on the model
		save: (data, options = {}) ->
			_.defaults options,
				wait: true