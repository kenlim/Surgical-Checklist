log = (args...) ->
    console.log.apply console, args if console.log?

$( () ->
ChecklistDoc = Backbone.Model.extend(
	initialize :  (stuff) ->
		this.url = stuff.url
)

Checklist = Backbone.Model.extend()

Item = Backbone.Model.extend()

DocumentView = Backbone.View.extend(
	model : ChecklistDoc

	el : "#documentView"

	initialize : () ->
		this.model.bind('change', this.render, this)

		this.model.fetch(
			success : () -> log("A winner is you")
			error : (model, response) -> log("Error fetching DocumentView", model, response)
		)


	render : () -> 
		log("finish!")
		$(this.el).html(Mustache.render($('#document-template').html(), this.model.toJSON()))
		return this
)


appView = new DocumentView( model : new ChecklistDoc( url : "who-surgical-checklist.json"))


)