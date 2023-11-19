extends Node2D


var listeningForClicks = false;

func _ready():
	pass


func _on_Proceed_pressed():
	#emit_signal("dialogue_done")
	if(listeningForClicks):
		
		print_debug("starting ink")

		#TODO instantiate the ink player, or emit a signal, or something 


		return
	pass


