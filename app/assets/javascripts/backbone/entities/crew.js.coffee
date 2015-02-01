@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Crew extends App.Entities.Model
		# we need a route cause it being fetched by itself without going
		# through the collection
		# Backbone knows what to get depending if the request has id or not
		urlRoot: -> Routes.crew_index_path()

	class Entities.CrewCollection extends App.Entities.Collection
		model: 	Entities.Crew	
		url:		Routes.crew_index_path()

	API = 
		getCrew: ->
			crew = new Entities.CrewCollection
			crew.fetch
				reset: true 
			crew 

		getCrewMember: (id) ->
			member = new Entities.Crew 
				id: id

			member.fetch()
			member

		newCrewMember: ->
			new Entities.Crew

	App.reqres.setHandler "crew:entities", ->
		API.getCrew()

	App.reqres.setHandler "crew:entity", (id) ->
		API.getCrewMember id

	App.reqres.setHandler "new:crew:entity", ->
		API.newCrewMember()