@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Controller extends App.Controllers.Base
		
		initialize: ->
			window.c = @
			crew = App.request "crew:entities"

			# 'when:fetched' was originally implemented in edit controller
			# Episode 6 part 1, min ok 55:00
			App.execute "when:fetched", crew, =>
				@layoutView = @getLayoutView crew

				@listenTo @layoutView, "show", =>
					@titleRegion()
					@panelRegion()
					@crewRegion crew

				# App.mainRegion.show @layoutView

				 # @show method has been extended in backbone/controllers/_base.js.coffee
				@show @layoutView

		onDestroy: ->
			console.info "closing controller!"

		titleRegion: ->
			titleView = @getTitleView()
			@layoutView.titleRegion.show titleView

		panelRegion: ->
			panelView = @getPanelView()

			@listenTo panelView, "new:crew:button:clicked", =>
				@newRegion()

			@layoutView.panelRegion.show panelView

		newRegion: ->
			# region = @layoutView.newRegion
			# newView = App.request "new:crew:member:view"

			# # "form:cancel" is called from formWrapper
			# @listenTo newView, "form:cancel", =>
			# 	region.reset()

			# region.show newView

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


