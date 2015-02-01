@PlanetExpress.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Controller extends App.Controllers.Application

		initialize: (options) ->
			navs = App.request "nav:entities"
			listView = @getListView navs
			@show listView

		getListView: (navs) ->
			new List.Header	
				collection: navs