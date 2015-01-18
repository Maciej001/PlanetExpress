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
			@listenTo @formLayout, "form:submit", @formSubmit 

		formSubmit: ->
			data = Backbone.Syphon.serialize @formLayout

			# first check data and than save it
			# trigger "form:submit" event on our editView and ask
			# if it's ok to update the model
			if @contentView.triggerMethod("form:submit", data) isnt false  
				model = @contentView.model
				@processFormSubmit data, model

		processFormSubmit: (data, model) ->
			# before the model attributes are updated we want to wait 
			# for the server to validate data, and update only
			# if we don't get any errors
			# Let's implement it in our entities/_base/models.js.coffee
			model.save data 

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

			# takes config objects, and adds/overrides its properties 
			# with optins object properties.
			# This is so footer:true, can be passed when creating 
			# form wrapper in edit_controller
			_.extend config, options

			buttons = @getButtons config.buttons

			new Form.FormWrapper
				# let's create options object:
				# pass config options to our form view
				config: config

				# forms require models in all cases no matter what!
				model: @contentView.model 

				# returned by "form:button:entities" request
				buttons: buttons 

		getDefaultConfig: (config = {}) ->
			# _.defaults(object, *defaults) - fills in undefined properties
			# in object with the first value in the following list 
			# of defaults objects
			# If form foter is undefined than it's set to 'true'
			_.defaults config,
				footer: true
				focusFirstInput: true

		getButtons: (buttons = {}) ->
			App.request("form:button:entities", buttons, @contentView.model) unless buttons is false
	

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



