@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	Edit.Controller = 
		edit: (id, crew) ->
			# use either return of App.request "crew:entity" 
			# otherwise use CRUD id. Often before editing 
			# we will have already fetched list of crew members.
			# we should try to avoid asking server (CRUD) to 
			# fetch member with id = id again. 
			# This way we avoid ajaxing/fetching again same data. 
			#
			# Because the 'edit' page is routeable, user can hit the page, 
			# without going through the 'list'. 
			# and then we have to use id and ajax request. In this case 
			# the member/crew will be undefined.
			# Implementation of App.request "crew:entities" is in 
			# entities/crew.js.coffee 
			crew or= App.request "crew:entity", id

			crew.on "all", (e) -> console.log "event: ", e

			# Commands are used by one component to tell other component
			# to perfom an action without direct reference to it.
			# Callback of a command is not expected to return value
			# *****
			# Create new view for editing only if 'crew' is fetched
			# Implementation moved to entities/_base/_fetch.js.coffee
			App.execute "when:fetched", crew, => 
				@layoutView = @getLayoutView crew 

				@layoutView.on "show", =>
					@formRegion crew

				App.mainRegion.show @layoutView

		formRegion: (crew) ->
			# a bit strange construction for now
			#  
			# Q: where should we implement the formView?
			# A: in folder where we will place reusable objects 
			# backbone/components form wrapper later can be used
			# anywhere in our application.

			# create View
			editView = @getEditView crew

			# wrap editView in a form 
			# implemented in components/form/form_controller
			# "form:wrapper"  takes 2 arguments:
			# view and options object, so we can pass footer: true and
			# arguments set in editView, will be overriden by 
			# options ie. footer: true
			formView = App.request "form:wrapper", editView, 
				footer: true

			# display it within layout
			@layoutView.formRegion.show formView

		getLayoutView: (crew) ->
			new Edit.LayoutView
				model: crew	

		getEditView: (crew) ->
			new Edit.Crew  
				model: crew


















				