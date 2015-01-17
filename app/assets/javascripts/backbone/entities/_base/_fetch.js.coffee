@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	App.commands.setHandler "when:fetched", (entities, callback) ->
		xhrs = []

		# chain - enables chaining of functions. It returns wrapped object
		# 				until value() method is called
		# flatten - flattens object and returns flat array
		# pluck - maps array of object extracting only '_fetch' object 
		xhrs = _.chain([entities]).flatten().pluck("_fetch").value()

		$.when(xhrs...).done ->
			callback()