extends Node2D



func _ready():
	pass


func _on_Proceed_pressed():
	emit_signal("dialogue_done")
