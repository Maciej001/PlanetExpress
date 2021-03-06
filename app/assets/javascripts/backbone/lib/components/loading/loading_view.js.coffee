@PlanetExpress.module "Components.Loading", (Loading, App, Backbone, Marionette, $, _) ->

	class Loading.LoadingView extends App.Views.ItemView
		template: false # empty div
		className: "loading-container"

		onShow: ->
			options = @_getOptions()
			@$el.spin options

		onClose: ->
			@$el.spin false

		_getOptions: ->
		  lines: 2, # The number of lines to draw
		  length: 5, # The length of each line
		  width: 35, # The line thickness
		  radius: 5, # The radius of the inner circle
		  corners: 1, # Corner roundness (0..1)
		  rotate: 0, # The rotation offset
		  direction: 1, # 1: clockwise, -1: counterclockwise
		  color: ['#D9301B', '#3B99DE'] #000', # #rgb or #rrggbb or array of colors
		  speed: 1, # Rounds per second
		  trail: 70, # Afterglow percentage
		  shadow: false, # Whether to render a shadow
		  hwaccel: false, # Whether to use hardware acceleration
		  className: 'spinner', # The CSS class to assign to the spinner
		  zIndex: 2e9, # The z-index (defaults to 2000000000)
		  top: '50%', # Top position relative to parent
		  left: '50%' # Left position relative to parent


