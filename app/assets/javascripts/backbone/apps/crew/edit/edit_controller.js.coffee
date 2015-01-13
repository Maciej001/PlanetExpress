@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	Edit.Controller = 
		edit: (id, crew) ->
			# use either return of App.request "crew:entity" otherwise use CRUD id
			# cause very often before editing we will have already fetched list
			# of crew members, we should try to avoid asking server (CRUD) to 
			# fetch member with id = id. This way we avoid ajaxing/fetching again
			# same data. 
			# but because the 'edit' page is routeable, user can hit the page, 
			# without going through the 'list' though. 
			# and then we have to use id and ajax request. In this case 
			# the member/crew will be undefined.
			# Implementation of App.request "crew:entities" is in 
			# entities/crew.js.coffee 
			crew or= App.request "crew:entity", id

			# crew.on "all", (e) -> console.info e

			# Commands are used by one component to tell other component
			# to perfom an action without direct reference to it.
			# Callback of a command is not expected to return value
			# *****
			# Create new view for editing only if 'crew' is fetched
			# Implementation moved to entities/_base/_fetch.js.coffee
			App.execute "when:fetched", crew, =>
				editView = @getEditView crew 

				App.mainRegion.show editView

		getEditView: (crew) ->
			new Edit.Crew
				model: crew	


















				