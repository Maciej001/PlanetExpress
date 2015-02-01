@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Controller extends App.Controllers.Application   
		
		initialize: ->
			crew = App.request "crew:entities"

			@layoutView = @getLayoutView()

			@listenTo @layoutView, "show", =>
				@titleRegion()
				@panelRegion()
				@crewRegion crew

			@show @layoutView, loading: true

		titleRegion: ->
			titleView = @getTitleView()
			@show titleView, region: @layoutView.titleRegion

		panelRegion: ->
			panelView = @getPanelView()

			@listenTo panelView, "new:crew:button:clicked", =>
				@newRegion()

			@show panelView, region: @layoutView.panelRegion

		newRegion: ->
			App.execute "new:crew:member", @layoutView.newRegion
 
		crewRegion: (crew) ->
			crewView = @getCrewView crew

			@listenTo crewView, "childview:crew:member:clicked", (child, args) ->
				App.vent.trigger "crew:member:clicked", args.model

			@listenTo crewView, "childview:crew:delete:clicked", (args) ->
				model = args.model
				if confirm "Are you sure you want to delete #{model.get("name")}?" then model.destroy() else false

			@show crewView, 
				loading: true
				region: @layoutView.crewRegion

		getPanelView: ->
			new List.Panel

		getTitleView: ->
			new List.Title

		getLayoutView: (crew) ->
			new List.LayoutView
				collection: crew

		getCrewView: (crew) ->
			new List.Crew 
				collection: crew


