@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller = 
		
		list: ->
			crew = App.request "crew:entities"

			# 'when:fetched' was originally implemented in edit controller
			# Episode 6 part 1, min ok 55:00
			App.execute "when:fetched", crew, =>
				@layoutView = @getLayoutView()

				@layoutView.on "show", =>
					@titleRegion()
					@panelRegion()
					# @newRegion() shows only after 'Add' clicked
					@crewRegion crew

				App.mainRegion.show @layoutView

		titleRegion: ->
			titleView = @getTitleView()
			@layoutView.titleRegion.show titleView

		panelRegion: ->
			panelView = @getPanelView()

			panelView.on "new:crew:button:clicked", =>
				@newRegion()

			@layoutView.panelRegion.show panelView

		newRegion: ->
			region = @layoutView.newRegion
			newView = App.request "new:crew:member:view"

			# "form:cancel" is called from formWrapper
			newView.on "form:cancel", =>
				region.reset()

			region.show newView

		crewRegion: (crew) ->
			crewView = @getCrewView crew

			crewView.on "childview:crew:member:clicked", (child, member) ->
				App.vent.trigger "crew:member:clicked", member

			@layoutView.crewRegion.show crewView

		getPanelView: ->
			new List.Panel

		getTitleView: ->
			new List.Title

		getLayoutView: ->
			new List.LayoutView

		getCrewView: (crew) ->
			new List.Crew 
				collection: crew


