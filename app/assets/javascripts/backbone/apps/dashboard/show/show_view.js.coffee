@PlanetExpress.module "DashboardApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.LayoutView extends App.Views.LayoutView
		template: "dashboard/show/show_layout"

		regions: 
			fooRegion: "#foo-region" 