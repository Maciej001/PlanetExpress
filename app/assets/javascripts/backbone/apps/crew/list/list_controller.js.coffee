@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller = 
		
		list: ->
			@layoutView = @getLayoutView()

			@layoutView.on "show", =>
				@titleRegion()
				@panelRegion()
				@newRegion()
				@crewRegion()

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

		crewRegion: ->
			crewView = @getCrewView()
			@layoutView.crewRegion.show crewView

		getPanelView: ->
			new List.Panel

		getTitleView: ->
			new List.Title

		getLayoutView: ->
			new List.LayoutView

		getNewView: ->
			new List.New

		getCrewView: ->
			new List.Crew