@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Button extends Entities.Model 

	class Entities.ButtonsCollection extends Entities.Collection	
		model: Entities.Button

	API = 
		getFormButtons: (buttons, model) ->
			buttons = @getDefaultButtons buttons, model

			array = []
			array.push {
				type:"cancel" 
				className: "button small secondary radius"
				text: buttons.cancel
			} if buttons.cancel
			array.push {
				type:"primary" 
				className: "button small radius"
				text: buttons.primary
			} if buttons.primary

			array.reverse() if buttons.placement is "left"

			buttonCollection = new Entities.ButtonsCollection array 
			buttonCollection.placement = buttons.placement
 
			return buttonCollection


		getDefaultButtons: (buttons, model) ->
			_.defaults buttons,
				primary: 		if model.isNew() then "Create" else "Update"
				cancel:			"Cancel"
				placemenet:	"right"

	App.reqres.setHandler "form:button:entities", (buttons = {}, model) ->
		API.getFormButtons buttons, model




