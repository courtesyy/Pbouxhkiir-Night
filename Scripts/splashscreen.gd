extends Node2D


var inkPlayer = preload("res://Scenes/InkPlayer.tscn")


var listeningForClicks = false;

func _ready():
	pass


func _on_Proceed_pressed():
	pass

func _process(_delta):

	if(listeningForClicks):

		listeningForClicks = false;
		
		print_debug("starting ink")

		# instantiate the ink player

		var scene_instance = inkPlayer.instance()
		get_parent().add_child(scene_instance)
		

		#hide itself 
		hide()
		##delete this 
		queue_free()

		return
	pass


