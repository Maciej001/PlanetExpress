@PlanetExpress.module "CrewApp.New", (New, App, Backbone, Marionette, $, _) ->

	New.Controller = 

		newCrew: ->
			# created in entities/crew.js.coffee
			crew = App.request "new:crew:entity"

			# 'created' event is triggered by model.save method 
			# entities/_base/models.js.coffee
			crew.on "created", ->
				# serviced in crew_app.js
				App.vent.trigger "crew:created", crew

			newView = @getNewView crew

			App.request "form:wrapper", newView

		getNewView: (crew) ->
			new New.Crew 
				model: crew