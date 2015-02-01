@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Controller extends App.Controllers.Application

		initialize: (options) ->
			{ crew, id } = options
			# instead of 
			# crew 	= options.crew
			# id 		= options.id

			crew or= App.request "crew:entity", id

			@listenTo crew, "updated", ->
				App.vent.trigger "crew:updated", crew


			@layoutView = @getLayoutView crew 

			@listenTo @layoutView, "show", =>
				@titleRegion crew
				@formRegion crew

			@show @layoutView, loading: true

		titleRegion: (crew) ->
			titleView = @getTitleView crew

			@show titleView, region: @layoutView.titleRegion

		formRegion: (crew) ->
			# a bit strange construction for now
			#  
			# Q: where should we implement the formView?
			# A: in folder where we will place reusable objects 
			# backbone/components form wrapper later can be used
			# anywhere in our application.

			# create View
			editView = @getEditView crew

			@listenTo editView, "form:cancel", ->
				# vent is used to add event to Event Aggregator
				App.vent.trigger "crew:cancelled", crew

			# wrap editView in a form 
			# implemented in components/form/form_controller
			# "form:wrapper"  takes 2 arguments:
			# view and options object, so we can pass footer: true and
			# arguments set in e ditView, will be overriden by 
			# options ie. footer: true
			formView = App.request "form:wrapper", editView, 
				footer: true

			@show formView, region: @layoutView.formRegion

		getTitleView: (crew) ->
			new Edit.Title
				model: crew

		getLayoutView: (crew) ->
			new Edit.LayoutView
				model: crew	

		getEditView: (crew) ->
			new Edit.Crew  
				model: crew


















				