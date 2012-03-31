log = (args...) ->
    console.log.apply console, args if console.log?

$( () ->
	log("hello world!")
)