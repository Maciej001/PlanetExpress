@PlanetExpress.module "Components.Loading", (Loading, App, Backbone, Marionette, $, _) ->

	class Loading.LoadingController extends App.Controllers.Application

		initialize: (options) ->
			{ view, config } = options

			_.defaults config, 
				entities: @getEntities view
				# if config is set to true in passed object in @show method
				# than we freeze on loadingView with a spinner
				debug: false

			loadingView = @getLoadingView()
			@show loadingView

			@showRealView view, loadingView, config

		showRealView: (realView, loadingView, config) ->
			App.execute "when:fetched", config.entities, =>
				# If the region we are trying to insert is not the loadingView then
				# we know the user has navigated to a differentpage while the loading
				# view was still open. In that case, we know to manually close
				# the original view so its controller is also closed. We also 
				# prevent showing the real view (which would snap the user back 
				# to the old view unexpectedly)
				return realView.destroy() if @region.currentView isnt loadingView

				@show realView unless config.debug

		getEntities: (view) ->
			# return entities manually set during show method call or pull
			# off the model and collection from the view (if they exist)
			# compact() - removes all empty, null, etc unwanted elements 
			_.chain(view).pick("model","collection").toArray().compact().value()
 
		getLoadingView: ->
			new Loading.LoadingView 

	App.commands.setHandler "show:loading", (view, options) ->
		# controllers accept one argument so let's pass it as object
		new Loading.LoadingController 
			view: view
			region: options.region
			config: options.loading
     