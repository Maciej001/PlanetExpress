@PlanetExpress.module "AdminApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.LayoutView extends App.Views.LayoutView
		template: "admin/list/list_layout"

		regions: 
			bannerRegion: 		"#banner-region"
			adminNavsRegion: 	"#admin-navs-region"
			articleRegion: 		"#article-region"

	class List.Banner extends App.Views.ItemView
		template: "admin/list/_banner"

	class List.Nav extends App.Views.ItemView
		template: "admin/list/_nav"
		tagName: 	"li"

	class List.Navs extends App.Views.CollectionView
		tagName: 		"ul"
		className: 	"side-nav"	 
		childView: 	List.Nav
