extends Control

# this is on the root of the dialogue scenes 

var counter = 1
var bubbleCount
onready var bubbleParent = $Dialogues

signal choice_selected(index)

func _ready():

	bubbleCount = bubbleParent.get_child_count()

	print("bubble count is ", bubbleCount)

	## start with dialogue hidden except the first 
	for i in range(1, bubbleCount):
		print(" ", i)
		bubbleParent.get_child(i).hide()
	

# called when something is clicked 
func _on_Proceed_pressed():

	print("got proceed pressed")
	
	# next bubble OR tell ink to make the choice if complete 
	if(counter < bubbleCount):
		bubbleParent.get_child(counter).displayBubble()
		counter = counter + 1
	else: 
		# this will tell ink to continue and make the first choice 
		emit_signal("choice_selected", 1)
		get_parent().get_parent().makeChoice(1)

	#emit_signal("dialogue_done")



