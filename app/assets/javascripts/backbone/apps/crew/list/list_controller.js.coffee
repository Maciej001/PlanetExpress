@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller = 
		
		list: ->
			crew = App.request "crew:entities"
			@layoutView = @getLayoutView()

			@layoutView.on "show", =>
				@titleRegion()
				@panelRegion()
				@newRegion()
				@crewRegion crew

			App.mainRegion.show @layoutView

		titleRegion: ->
			titleView = @getTitleView()
			@layoutView.titleRegion.show titleView

		panelRegion: ->
			panelView = @getPanelView()
			@layoutView.panelRegion.show panelView

		newRegion: ->
			newView = @getNewView()
			@layoutView.newRegion.show newView

		crewRegion: (crew) ->
			crewView = @getCrewView crew
			@layoutView.crewRegion.show crewView

		getPanelView: ->
			new List.Panel

		getTitleView: ->
			new List.Title

		getLayoutView: ->
			new List.LayoutView

		getNewView: ->
			new List.New

		getCrewView: (crew) ->
			new List.Crew 
				collection: crew