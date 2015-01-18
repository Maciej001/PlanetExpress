@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->
	
	class Edit.LayoutView extends App.Views.LayoutView
		template: "crew/edit/edit_layout"

		regions: 
			formRegion: "#form-region"

		# We don't need below code anymore, because we implemented
		# 'when:fetched' method

		# # When we are rendering the edit form, we still did not fetch all 
		# # crew member data. 'sync' is the last event that fires after 
		# # fetching modelEvents: 
		# #	"sync": "render" 

	class Edit.Crew extends App.Views.ItemView
		template: "crew/edit/edit_crew"

		# form: 
		# 	footer: true/false
		# 	focusFirstInput: true/false
		# 	buttons:  omitted=true/false
		# 		primary: "Save"
		# 		cancel: "Cancel"
		# 		placement: "right"
		#
		# if buttons.cancel = false - 'cancel' button will be omitted
		# if buttons.primary = false - 'primary' button will be omitted
		# if buttons are to be omitted at all
		# use buttons: false
		form:
			footer: true
			buttons: 
				primary: "Save"
				cancel: "Olej"
				placement: "right"

		# triggered from form_controller to validate data
		# triggerMethod("form:submit", data) on the view
		# 'on' is added and first letters capitalized
		onFormSubmit: (data) ->
			console.log "Edit.Crew onFormSubmit", data
			false




