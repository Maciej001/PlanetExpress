@PlanetExpress.module "DashboardApp.Show", (Show, App, Backbone, Marionette, $, _) ->
	
	class Show.Controller extends App.Controllers.Application

		initialize: ->

			@layoutView = @getLayoutView()

			@listenTo @layoutView, "show", =>

			@show @layoutView

		getLayoutView: ->
			new Show.LayoutView
