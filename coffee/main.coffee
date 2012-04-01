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

	template : _.template($('#document-template').html())
	listTemplate :  _.template($('#checklist-template').html())

	render : () -> 
		log("finish!")
		$(this.el).html(this.template(this.model.toJSON()))
		$(this.el).append(this.listTemplate(checklist)) for checklist in this.model.get("checklists")
		return this
)


appView = new DocumentView( model : new ChecklistDoc( url : "who-surgical-checklist.json"))


)