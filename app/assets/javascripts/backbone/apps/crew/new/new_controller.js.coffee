@PlanetExpress.module "CrewApp.New", (New, App, Backbone, Marionette, $, _) ->

	class New.Controller extends App.Controllers.Base
		initialize: ->			
			# our base controller already knows the @region = newRegion
			# because it has been assigned in constructor
			# created in entities/crew.js.coffee
			crew = App.request "new:crew:entity"

			# 'created' event is triggered by model.save method 
			# entities/_base/models.js.coffee
			@listenTo crew, "created", ->
				# serviced in crew_app.js
				App.vent.trigger "crew:created", crew

			newView = @getNewView crew 
			formView =  App.request "form:wrapper", newView

			@listenTo newView, "form:cancel", =>
				@region.destroy()

			@show formView

		getNewView: (crew) ->
			new New.Crew 
				model: crew  