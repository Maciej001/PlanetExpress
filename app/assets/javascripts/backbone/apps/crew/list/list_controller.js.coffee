@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Controller extends App.Controllers.Application   
		
		initialize: ->
			crew = App.request "crew:entities"

			App.execute "when:fetched", crew, =>
				@layoutView = @getLayoutView crew

				@listenTo @layoutView, "show", =>
					@titleRegion()
					@panelRegion()
					@crewRegion crew

				# pass view and options object

				@show @layoutView,  
					loading: 
						entities: crew
						

		titleRegion: ->
			titleView = @getTitleView()
			@layoutView.titleRegion.show titleView

		panelRegion: ->
			panelView = @getPanelView()

			@listenTo panelView, "new:crew:button:clicked", =>
				@newRegion()

			@layoutView.panelRegion.show panelView

			App.execute "new:crew:member", @layoutView.newRegion
 
		crewRegion: (crew) ->
			crewView = @getCrewView crew

			@listenTo crewView, "childview:crew:member:clicked", (child, args) ->
				App.vent.trigger "crew:member:clicked", args.model

			@listenTo crewView, "childview:crew:delete:clicked", (args) ->
				model = args.model
				if confirm "Are you sure you want to delete #{model.get("name")}?" then model.destroy() else false

			@listenTo crewView, "childview:before:destroy", (args) ->

			@layoutView.crewRegion.show crewView


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


