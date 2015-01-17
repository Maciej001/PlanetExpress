@PlanetExpress.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

	# form controller is initialized with passed option object that gets
	# view and config(options)
	class Form.Controller extends Marionette.Controller

		initialize: (options = {}) ->
			@contentView = options.view

			@formLayout = @getFormLayout options.config

			# @formLayout.on "show", =>
			# 	@formContentRegion()
			# instead we can write 
			# when we use listenTo, listeners are removed when controller
			# closes down
			@listenTo @formLayout, "show", @formContentRegion

		formContentRegion: ->
			@formLayout.formContentRegion.show @contentView

		getFormLayout: (config = {}) ->
			new Form.FormWrapper

	App.reqres.setHandler "form:wrapper", (contentView, options = {}) ->

		# Controller takes only one argument so we have wrap our 
		# parameters in the object and pass it to controller
		# Since we create new Controller we have to implement
		# initialize function above     
		formController = new Form.Controller
			view: contentView
			config: options

		formController.formLayout 



