@PlanetExpress.module "DeliveriesApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.LayoutView extends App.Views.LayoutView
		template: "deliveries/list/list_layout"

		regions: 
			fooRegion: "#foo-region"