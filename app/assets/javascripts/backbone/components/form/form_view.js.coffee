@PlanetExpress.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->
	
	class Form.FormWrapper extends App.Views.LayoutView
		template: 	"form/form"
		tagName: 		"form"

		# we either want to 'edit' existing data or create 'new' form
		# so instead of setting "data-type": "edit"
		# let's use function
		attributes: ->
			"data-type":	@getFormDataType()

		regions:
			formContentRegion: "#form-content-region"  

		ui: 
			buttonContainer: "ul.inline-list"

		# triggers are stopped with preventDefault and stopPropagation methods
		triggers: 
			"submit"	: 	"form:submit" # implemented in form_controller

		initialize: ->
			# originaly to access options we had to write @options.config
			# @options.buttons
			# setInstance... will create @config and @buttons, so these 
			# are available in FormWrapper instance
			# method will be available for all views so implementation is in 
			# views/_base/view.js.coffee
			@setInstancePropertiesFor "config", "buttons"

		# Item views serialize a model or collection by default calling toJSON
		# Here we additionally serialize footer, so @footer is available
		# in template
		# Layout recieves opitions that were passed when calling
		# new Form.FormWrapper
		#   config: config <- options
		serializeData: ->
			footer: 	@config.footer

			# .toJSON makes our collection model available to template
			# buttons are passed around but if buttons: false then they 
			# will not get serialized 
			# don't call toJSON if buttons? is undefined
			# If value is undefined then use false

			buttons: 	@buttons?.toJSON() ? false

		# to focus on first element of the form
		onShow: ->
			# defers invoking the function until the current call stack 
			# has cleared
			_.defer =>
				@focusFirstInput() if @config.focusFirstInput
				@buttonPlacement() if @buttons

		buttonPlacement: ->
			@ui.buttonContainer.addClass @buttons.placement    

		focusFirstInput: ->
			@$(":input:visible:enabled:first").focus()

		getFormDataType: ->
			# isNew() - if model has not been yet saved to the server 
			# if model doesn't have id it's considered to be 'new'
			@model.isNew() ? "new" : "edit"





