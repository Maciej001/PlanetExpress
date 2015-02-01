@PlanetExpress.module "AdminApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.LayoutView extends App.Views.LayoutView
		template: "admin/list/list_layout"

		regions: 
			fooRegion: "#foo-region"
