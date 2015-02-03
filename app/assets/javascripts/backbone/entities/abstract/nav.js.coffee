@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Nav extends App.Entities.Model

		isDivider: -> @get("divider")

		choose: ->
			# sets the attribute on the model. Later you can bind events 
			# change:chosen
			@set chosen: true

		unchoose: ->
			@set chosen: false

		chooseByCollection: ->
			@collection.choose @  


	class Entities.NavsCollection extends App.Entities.Collection
		model: Entities.Nav

		choose: (model) ->
			_(@where chosen: true).invoke("unchoose")
			model.choose()

		chooseByName: (nav) ->
			@choose @findWhere(name: nav)

	API = 
		getNavs: ->
			navs = new Entities.NavsCollection [
				{ divider: true}
				{ name: "Dashboard", 	url: "#dashboard", 	icon: 'fi fi-widget' }
				{ divider: true}
				{ name: "Deliveries", 	url: "#deliveries", icon: 'fi fi-shopping-cart' }
				{ divider: true}
				{ name: "Crew", 				url: "#crew", 			icon: "fi fi-torsos-all" }
				{ divider: true}
				{ name: "Admin", 			url: "#admin", 			icon: "fi fi-wrench" }
				{ divider: true}
			]  
			
		getAdminNavs: ->
			new Entities.NavsCollection [
				{ name: "Locations", 	url: "#admin/locations", 	icon: "fi fi-marker" }
				{ name: "Recipients", url: "#admin/recipients", icon: "fi fi-torso" }
				{ name: "Contents", 	url: "#admin/contents", 	icon: "fi fi-page-multiple" }
				{ name: "Outcomes", 	url: "#admin/outcomes", 	icon: "fi fi-arrows-out"}
			]

	App.reqres.setHandler "nav:entities", ->
		API.getNavs()

	App.reqres.setHandler "admin:nav:entities", ->
		API.getAdminNavs()

