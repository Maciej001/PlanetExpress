@PlanetExpress = do (Backbone, Marionette) ->

	App = new Marionette.Application

	App.on "before:start", (options) ->
		App.environment = options.environment
		App.navs = App.request "nav:entities"

	App.rootRoute = Routes.crew_index_path()

	App.addRegions
		headerRegion: "#header-region"
		mainRegion:		"#main-region"
		footerRegion:	"#footer-region"

	App.addInitializer ->
		App.module("HeaderApp").start(App.navs)
		App.module("FooterApp").start()

	# navs is now accecible in listController as an option
	App.vent.on "nav:choose", (nav) ->
		# method works on collecion so is implemented in nav.js.coffee collection
		App.navs.chooseByName nav  

	App.on "start", (options) ->
		@startHistory()
		@navigate(@rootRoute, trigger: true) unless @getCurrentRoute()

	App.reqres.setHandler "default:region", ->
		App.mainRegion

	App