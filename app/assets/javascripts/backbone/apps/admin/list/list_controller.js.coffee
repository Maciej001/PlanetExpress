@PlanetExpress.module "AdminApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Controller extends App.Controllers.Application

		initialize: ->

			@layoutView = @getLayoutView()

			@listenTo @layoutView, "show", =>

			@show @layoutView

		getLayoutView: ->
			new List.LayoutView
