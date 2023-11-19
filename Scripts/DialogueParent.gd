extends Control

# this is on the root of the dialogue scenes 

var counter = 1
var bubbleCount
onready var bubbleParent = $Dialogues

func _ready():

	bubbleCount = bubbleParent.get_child_count()

	## start with dialogue hidden except the first 
	for i in range(1, bubbleCount):
		get_child(i).hide()
	

# called when something is clicked 
func _on_Proceed_pressed():

	
	# next bubble OR tell ink to make the choice if complete 
	if(counter < bubbleCount):
		counter = counter + 1
		bubbleParent.get_child(counter).displayBubble()
	else: 
		# this will tell ink to continue and make the first choice 
		emit_signal("choice_selected", 1)

	emit_signal("dialogue_done")



