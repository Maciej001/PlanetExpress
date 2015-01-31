@PlanetExpress.module "Components.Loading", (Loading, App, Backbone, Marionette, $, _) ->

	class Loading.LoadingController extends App.Controllers.Application

		initialize: (options) ->
			{ view } = options

			loadingView = @getLoadingView()
			@show loadingView

		getLoadingView: ->
			new Loading.LoadingView 

	App.commands.setHandler "show:loading", (view, options) ->
		# controllers accept one argument so let's pass it as object
		new Loading.LoadingController 
			view: view
			region: options.region
    