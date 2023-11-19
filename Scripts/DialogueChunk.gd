extends Node

var id = 0

var index = 0
var bubbleCount = 0

#export var nextChunk : Resource # the next scene 

# Called when the node enters the scene tree for the first time.
func _ready():

	#count the number of children speech bubbles 
	bubbleCount = get_child_count()
	print_debug("bubble count ", bubbleCount)
	showNextBubble()

#TODO pass the text

func showNextBubble():
	get_child(index).display()
	index = index + 1

#func showNextChoice(choiceType):
	#TODO 
	#check if loading the card choice ui or the dialogue choice ui using ink variable choiceMode 
	#pass


# not using, ink does this now 
#func loadNextChunk():

	##print("RAN OUT OF BUBBLES, SHOULD LOAD NEXT CHUNK")

	#if(!nextChunk):
		#printerr("NO NEXT CHUNK GIVEN TO THIS CHUNK")
		#TODO make things happen when it hits the ending 
	
	#instantiate the next chunk
	#var scene_instance = nextChunk.instance()
	#get_parent().add_child(scene_instance)

	##delete this scene
	#queue_free()
	#pass



