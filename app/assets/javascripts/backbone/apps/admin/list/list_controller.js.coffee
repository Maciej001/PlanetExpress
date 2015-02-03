@PlanetExpress.module "AdminApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Controller extends App.Controllers.Application

		initialize: ->
			adminNavs = App.request "admin:nav:entities"
			@layoutView = @getLayoutView()

			@listenTo @layoutView, "show", =>
				@bannerRegion()
				@listRegion adminNavs

			@show @layoutView

		bannerRegion: ->
			bannerView = @getBannerView()
			@show bannerView, region: @layoutView.bannerRegion

		listRegion: (adminNavs) ->
			listView = @getListView adminNavs
			@show listView, region: @layoutView.adminNavsRegion

		getListView: (adminNavs) ->
			new List.Navs 
				collection: adminNavs

		getBannerView: ->
			new List.Banner

		getLayoutView: ->
			new List.LayoutView

		


