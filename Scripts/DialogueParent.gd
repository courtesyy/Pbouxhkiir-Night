extends Control

# this is on the root of the dialogue scenes 

var counter = 0

func _ready():

	## start with dialogue hidden except the first 
	for i in range(1, get_child_count()):
		get_child(i).hide()
	

# called when something is clicked 
func _on_Proceed_pressed():

	

	# continue in ink and get text 

	# TODO get text from ink!
	get_child(counter).displayBubble("PLACEHOLDER TEXT")

	counter = counter + 1

	emit_signal("dialogue_done")



