@PlanetExpress = do (Backbone, Marionette) ->

	App = new Marionette.Application

	App.rootRoute = Routes.crew_index_path()

	App.addRegions
		headerRegion: "#header-region"
		mainRegion:		"#main-region"
		footerRegion:	"#footer-region"

	App.addInitializer ->
		App.module("HeaderApp").start()
		App.module("FooterApp").start()

	App.on "start", (options) ->
		@startHistory()
		@navigate(@rootRoute, trigger: true) unless @getCurrentRoute()

	App.reqres.setHandler "default:region", ->
		App.mainRegion

	App.commands.setHandler "register:instance", (instance, id) ->
		# register is defined in config/marionette/application.js.coffee
		App.register instance, id 

	App.commands.setHandler "unregister:instance", (instance, id) ->
		App.unregister instance, id

	App