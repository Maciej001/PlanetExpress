@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.LayoutView extends App.Views.LayoutView
		template: "crew/list/templates/list_layout"

		regions: 
			titleRegion: 	"#title-region"
			panelRegion: 	"#panel-region"
			newRegion: 		"#new-region"
			crewRegion: 	"#crew-region"

	class List.Title extends App.Views.ItemView
		template: "crew/list/templates/_title" 

	class List.Panel extends App.Views.ItemView
		template: "crew/list/templates/_panel"

	class List.New extends App.Views.ItemView
		template: "crew/list/templates/_new"

	class List.Crew extends App.Views.ItemView
		template: "crew/list/templates/_crew"