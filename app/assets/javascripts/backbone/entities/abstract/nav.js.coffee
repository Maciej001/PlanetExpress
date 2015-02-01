@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Nav extends App.Entities.Model

	class Entities.NavsCollection extends App.Entities.Collection
		model: Entities.Nav

	API = 
		getNavs: ->
			navs = new Entities.NavsCollection [
				{name: "Dashboard", 	url: "#dashboard", 	icon: 'fi fi-widget'}
				{name: "Deliveries", 	url: "#deliveries", icon: 'fi fi-shopping-cart'}
				{name: "Crew", 				url: "#crew", 			icon: "fi fi-torsos-all"}
				{name: "Admin", 			url: "#admin", 			icon: "fi fi-wrench"}
			]
			

	App.reqres.setHandler "nav:entities", ->
		API.getNavs()

