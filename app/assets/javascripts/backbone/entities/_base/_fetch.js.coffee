@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	App.commands.setHandler "when:fetched", (entities, callback) ->
		xhrs = []

		# chain - enables chaining of functions. It returns wrapped object
		# 				until value() method is called
		# flatten - flattens object and returns flat array
		# pluck - maps array of object extracting only '_fetch' object 
		xhrs = _.chain([entities]).flatten().pluck("_fetch").value()

		# Code replaced by above _.chain...
		# if _.isArray(entities)
		# 	# extract properties from entities and push it to our own array
		# 	xhrs.push(entity._fetch) for entity in entities
		# else
		# 	# if entities contains single object
		# 	xhrs.push(entities._fetch)

		# xhrs... splat - takes an array and passes each item as
		# separate argument
		$.when(xhrs...).done ->
			callback()