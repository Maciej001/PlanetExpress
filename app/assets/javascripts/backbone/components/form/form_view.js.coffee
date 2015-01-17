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

		# Item views serialize a model or collection by default calling toJSON
		# Here we additionally serialize footer, so @footer is available
		# in template
		# Layout recieves opitions that were passed when calling
		# new Form.FormWrapper
		#   config: config <- options
		serializeData: ->
			footer: @options.config.footer

		# to focus on first element of the form
		onShow: ->
			# defers invoking the function until the current call stack 
			# has cleared
			_.defer =>
				@focusFirstInput() if @options.config.focusFirstInput

		focusFirstInput: ->
			@$(":input:visible:enabled:first").focus()

		getFormDataType: ->
			# isNew() - if model has not been yet saved to the server 
			# if model doesn't have id it's considered to be 'new'
			if @model.isNew() then "new" else "edit"





