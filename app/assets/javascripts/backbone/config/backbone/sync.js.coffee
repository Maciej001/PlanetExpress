# Extending sync event, so we will not display empty forms or views, 
# before data has been fetched

# Backbone.sync is called every time Backbone reads or saves model 
# to the server. It uses jQuery.ajax to make RESTful JSON request 
# and returns jqXHR (jQuery XMLHttpRequest). 
# You can overwrite it to use different persistence strategy, such as
# WebSockets, XML transport, or Local Storage.
# Whenever a model or collection begins a sync with the serve, a 'request'
# event is emitted. If the request completes successfully you'll get 
# a 'sync' event, and an 'error' event if not. 

do (Backbone) ->

	_sync = Backbone.sync


	# method - "read" that is returned by 'fetch' method
	# entity - is model or collection, in our case Crew
	# Object - options passed to sync - success and error callbacks
	Backbone.sync = (method, entity, options = {}) ->
		sync = _sync(method, entity, options) # XHR returned

		if !entity._fetch and method is "read"
			entity._fetch = sync





 





