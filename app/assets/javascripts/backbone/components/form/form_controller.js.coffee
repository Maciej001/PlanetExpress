@PlanetExpress.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

	# form controller is initialized with passed option object that gets
	# view and config(options)
	class Form.Controller extends Marionette.Controller

		initialize: (options = {}) ->
			@contentView = options.view

			# at this point options.config was not passed
			@formLayout = @getFormLayout options.config

			# @formLayout.on "show", =>
			# 	@formContentRegion()
			# instead we can write 
			# when we use listenTo, listeners are removed when controller
			# closes down
			@listenTo @formLayout, "show", @formContentRegion

		formContentRegion: ->
			@formLayout.formContentRegion.show @contentView

		getFormLayout: (options = {}) ->
			# _.result(object, property)
			# _.result lets you get a named value from an object
			# without knowing weather that value is stored as 
			# property or a method
			# in below case @contentView.form - can be either 
			# property or a method and we still get an object
			# form { footer: false }
			# otherwise we could just 
			config = @getDefaultConfig _.result(@contentView, "form")
			new Form.FormWrapper
				# pass config options to our form view
				config: config

				# forms require models in all cases 
				model: @contentView.model 

		# _.defaults(object, *defaults) - fills in undefined properties
		# in object with the first value in the following list 
		# of defaults objects
		# If form foter is undefined than it's set to 'true'
		getDefaultConfig: (config = {}) ->
			_.defaults config,
				footer: true
				focusFirstInput: true
				buttons: @getDefaultButtons config.buttons

		# returns flat object {primary: "Save",...}
		getDefaultButtons: (buttons = {}) ->
			_.defaults buttons, 
				primary: 		"Save"
				cancel: 		"Cancel"
				placement:	"right"

	App.reqres.setHandler "form:wrapper", (contentView, options = {}) ->
		throw new Error "No model found inside of form's contentView" unless contentView.model
		# Controller takes only one argument so we have wrap our 
		# parameters in the object and pass it to controller
		# Since we create new Controller we have to implement
		# initialize function above     
		formController = new Form.Controller
			view: contentView
			config: options

		formController.formLayout 



